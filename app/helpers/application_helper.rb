module ApplicationHelper

	def income_today
		prices = []
		@orders_today.each do |order|
			order.meals.each do |meal|
				prices << meal.price
			end
		end
		if !(prices.empty?)
			return prices.reduce(:+)
		else
			return '0 pln'
		end
	end

	def average_order_value
		if income_today != '0 pln' && income_today != nil?
			number_with_precision(income_today / @orders_today.count, precision: 2) + ' pln'
		else
			return 0.to_s + ' pln'
		end
	end


end
