# Create admin
admin = User.create(first_name: 'Marek', last_name: 'Mikołajczyk', email: 'legolas@example.com', password: 'legolas123', password_confirmation: 'legolas123', description: 'Ja tu jestem szeryfem.', city: 'Poznań', admin: true )

# Create user
user = User.create(first_name: 'Jarek', last_name: 'Kanarek', email: 'jarek@example.com', password: 'jarek123', password_confirmation: 'jarek123', description: 'Ja tu jestem paziem.', city: 'Poznań', admin: false )

# Create dish

Dish.create(name: 'Shrimp', price: '20', description: 'Perfect shrimps oh my god! come to brazil', category: 'Seafood')
Dish.create(name: 'Meatballs', price: '30', description: 'Meatballs om nom nom', category: 'Beef')
Dish.create(name: 'Scrambled Eggs', price: '10', description: 'Scrambled eggs Gordon Ramsay style!', category: 'Breakfasts')

# Create pinned post

PinnedPost.create(content: 'Radziejów miasto złodziejów.', user: admin)

# Create post

Post.create(content: 'Jestem knajtem i wale axa :)',  user: user)
