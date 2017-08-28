json.orders @user_orders do |order|
	json.id order.id
	json.user_id order.user_id
	json.meals order.meals do |meal|
		json.meal meal.name
	end
end