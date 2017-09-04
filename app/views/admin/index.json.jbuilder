json.users @users do |user|
	json.name user.name
	json.count user.orders.count
	json.orders user.orders
end