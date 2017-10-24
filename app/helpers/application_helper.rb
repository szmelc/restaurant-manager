module ApplicationHelper

	def income_today
		prices = []
		if !(@orders_today.empty?)
			@orders_today.each do |order|
				order.meals.each do |meal|
					prices << meal.price
				end
			end
		end
		if prices.empty?
			return 0
		else
			return prices.reduce(:+)
		end
	end

	def user_income_today
		prices = []
		@user_orders_today.each do |order|
			order.meals.each do |meal|
				prices << meal.price
			end
		end
		if prices.empty?
			return 0
		else
			prices.reduce(:+)		
		end
	end

	def average_order_value
		if income_today != 0 
			number_with_precision(income_today / @orders_today.count, precision: 2) + ' pln'
		else
			return 0.to_s + ' pln'
		end
	end



end
