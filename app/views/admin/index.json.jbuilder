json.users @users do |user|
	json.name user.name
	json.orders_count user.orders.count
	json.orders user.orders do |order|
		json.id order.id
		json.user_id order.user_id
		json.date order.date
		json.created_at order.created_at
		json.updated_at order.updated_at
		json.price order.total_price
		json.meals order.meals do |meal|
			json.name meal.name
			json.price meal.price
		end
	end
end
json.orders @orders do |order|
	json.created_at order.created_at
	json.date order.date
	json.price order.total_price
	json.meals order.meals
end