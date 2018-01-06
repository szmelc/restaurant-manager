class OrdersQuery
  attr_reader :relation

  def initialize(relation = Order.all)
    @relation = relation
  end

  def by_user(user)
    relation.where(user_id: user.id)
  end

  def today
    relation.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end
end
