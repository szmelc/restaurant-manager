# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create admin
admin = User.create(
  id: 1,
  first_name: 'Marek',
  last_name: 'Mikołajczyk',
  email: 'admin@admin.com',
  password: 'admin123',
  password_confirmation: 'admin123',
  description: 'Ja tu jestem szeryfem.',
  city: 'Poznań',
  admin: true
  )

# Create users
user_jarek = User.create(
  id: 2,
  first_name: 'Jarek',
  last_name: 'Kanarek',
  email: 'jarek@example.com',
  password: 'jarek123',
  password_confirmation: 'jarek123',
  description: 'Ja tu jestem paziem.',
  city: 'Poznań',
  admin: false
  )
user_janusz = User.create(
  id: 3,
  first_name: 'Janusz',
  last_name: 'Kowalski',
  email: 'janusz@example.com',
  password: 'janusz123',
  password_confirmation: 'janusz123',
  description: 'Moje życie jest do bani.',
  city: 'Krasnojarsk',
  admin: false
  )

# Create dish

Dish.create(
  name: 'Shrimps',
  price: '20',
  description: 'Perfect shrimps oh my god! come to brazil',
  category: 'Seafood'
  )
Dish.create(
  name: 'Meatballs',
  price: '30',
  description: 'Meatballs om nom nom',
  category: 'Beef'
  )
Dish.create(
  name: 'Scrambled Eggs',
  price: '10', description: 'Scrambled eggs Gordon Ramsay style!',
  category: 'Breakfasts'
  )

# Create pinned post

PinnedPost.create(content: 'Proszę dzisiaj nie popsuć frytkownicy.', user: admin)

# Create comment

comments = Comment.create(
  [
    {
      content: 'no',
      user_id: user_jarek.id
    },
    {
      content: 'please come',
      user_id: user_janusz.id
    }
  ]
  )

# Create posts

Post.create(
  [
    {
      content: 'Jestem knajtem i wale z axa :)',
      user: user_jarek
    },
    {
      content: 'come to brazil',
      user: user_janusz,
      comments: comments
    },
    {
      content: 'Radziejów miasto złodziejów.',
      user: user_jarek
    }
  ]
  )
# Create meals

first_mealset = Meal.create(
  [
    { name: 'Scrambled Eggs', price: 10 },
    { name: 'Meatballs', price: 20 }
  ]
  )
second_mealset = Meal.create(
  [
    { name: 'Scrambled Eggs', price: 10 },
    { name: 'Shrimps', price: 20 },
    { name: 'Meatballs', price: 20 }
  ]
  )

# Create orders

Order.create(user: admin, meals: first_mealset)
Order.create(user: user_jarek, meals: second_mealset)
Order.create(user: user_janusz, meals: second_mealset)
