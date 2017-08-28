json.extract! @user, :id, :name
json.orders @user.orders do |order|
	json.id order.id
	json.meals order.meals do |meal|
		json.name meal.name
		json.quantity meal.quantity
	end
end
# json.orders @user.orders, :id, :meals
# json.meals @user.order.meals, :name
