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

	def employee_income_today
		
	end

end
