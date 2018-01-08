class UserDecorator < SimpleDelegator

  def name
    [first_name, last_name].join(' ')
  end

  def phone_number
    phonenumber || '-'
  end

  def user_avatar
    if avatar.present?
      avatar.url(:thumb)
    else
      'thumb/missing.jpg'
    end
  end

  def bio
    description || I18n.t('user_decorator.description_missing')
  end

  def email_address
    email || '-'
  end

  def address_city
    city || '-'
  end

  def income_today
    @orders_today = OrdersQuery.new.today
    unless @orders_today.empty?
      sum_prices(@orders_today)
    end
  end

  def user_income_today(user)
    orders_today = OrdersQuery.new.today
    user_orders = OrdersQuery.new(orders_today).by_user(user)
    sum_prices(user_orders)
  end

  def average_order_value
    if income_today != 0
      amount_of_orders = @orders_today.count
      average = income_today.to_f / amount_of_orders
      average.round(2).to_s + ' pln'
    else
      return 0.to_s + ' pln'
    end
  end

  private

  def sum_prices(orders)
    prices = []
    orders.each do |order|
      sum = order.meals.sum(:price)
      prices << sum
    end
    if prices.empty?
      0
    else
      prices.reduce(:+).to_f
    end
  end
end
