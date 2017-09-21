module ApplicationHelper

	def income_today
		prices = []
		@orders_today.each do |order|
			order.meals.each do |meal|
				prices << meal.price
			end
		end
		return prices.reduce(:+)
	end

	def average_order_value
		number_with_precision(income_today / @orders_today.count, precision: 2) + ' pln'
	end


end
