# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create admin
admin = User.create(first_name: 'Marek', last_name: 'Mikołajczyk', email: 'legolas@example.com', password: 'legolas123', password_confirmation: 'legolas123', description: 'Ja tu jestem szeryfem.', city: 'Poznań', admin: true )

# Create user
user = User.create(first_name: 'Jarek', last_name: 'Kanarek', email: 'jarek@example.com', password: 'jarek123', password_confirmation: 'jarek123', description: 'Ja tu jestem paziem.', city: 'Poznań', admin: false )

# Create dish

Dish.create(name: 'Shrimps', price: '20', description: 'Perfect shrimps oh my god! come to brazil', category: 'Seafood')
Dish.create(name: 'Meatballs', price: '30', description: 'Meatballs om nom nom', category: 'Beef')
Dish.create(name: 'Scrambled Eggs', price: '10', description: 'Scrambled eggs Gordon Ramsay style!', category: 'Breakfasts')

# Create pinned post

PinnedPost.create(content: 'Radziejów miasto złodziejów.', user: admin)

# Create post

Post.create(content: 'Jestem knajtem i wale axa :)',  user: user)

# Create meals

meals = Meal.create([{ name: 'Scrambled Eggs', price: 10 }, { name: 'Meatballs', price: 20 }])

# Create order

Order.create(user: admin, meals: meals)
