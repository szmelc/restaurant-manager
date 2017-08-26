json.users do
	json.array!(@users) do |user| 
		json.name user.name
		json.url user_path(user)
	end
end

json.dishes do
	json.array!(@dishes) do |dish| 
		json.name dish.name
		json.url dish_path(dish)
	end
end