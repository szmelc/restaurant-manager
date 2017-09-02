json.orders @user_orders do |order|
	json.id order.id
	json.user_id order.user_id
	json.date order.created_at
	json.meals order.meals do |meal|
		json.meal meal.name
		json.quantity meal.quantity
	end
end