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
    description || 'no description given...'
  end

  def email_address
    email || '-'
  end

  def address_city
    city || '-'
  end

  def is_admin_or_displayed_user
    @current_user.id == @displayed_user.id || @current_user.admin
  end

  def income_today
    prices = []
    @orders_today = OrdersQuery.new.today
    unless @orders_today.empty?
      @orders_today.each do |order|
        sum = order.meals.sum(:price)
        prices << sum
      end
    end
    if prices.empty?
      0
    else
      prices.reduce(:+).to_f
    end
  end

  def user_income_today(user)
    prices = []
    orders_today = OrdersQuery.new.today
    user_orders = OrdersQuery.new(orders_today).by_user(user)
    user_orders.each do |order|
      sum = order.meals.sum(:price)
      prices << sum
    end
    prices.reduce(:+).to_f
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
end
