# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Seeding Data ...'

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts 'Development seeds only (for now)!'
  exit 0
end

# Let's do this ...

## CATEGORIES

puts 'Finding or Creating Categories ...'

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts 'Re-creating Products ...'

Product.destroy_all

product1 = cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

product2 = cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

product3 = cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

product4 = cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

product5 = cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

product6 = cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


product7 = cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

product8 = cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

product9 = cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

product10 = cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

product11 = cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

product12 = cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})

##creat admin user
puts 'Re-creating admin users ...'

user1 = User.find_or_create_by!({
  first_name: 'Bob',
  last_name: 'Smith',
  email: 'bob@smith.com',
  password_digest: BCrypt::Password.create('1234'),
  admin: true
})

user2 = User.find_or_create_by!({
  first_name: 'Jungle',
  last_name: 'Book',
  email: 'jungle@book.com',
  password_digest: BCrypt::Password.create('1234'),
  admin: true
})

##create non-admin user
puts 'Re-creating non-admin users ...'

user3 = User.find_or_create_by!({
  first_name: 'Jane',
  last_name: 'Doe',
  email: 'jane@doe.com',
  password_digest: BCrypt::Password.create('1234'),
})

user4 = User.find_or_create_by!({
  first_name: 'John',
  last_name: 'Doe',
  email: 'john@doe.com',
  password_digest: BCrypt::Password.create('1234')
})

##creating reviews
puts 'Creating reviews ...'

Review.destroy_all

product3.reviews.create!({
  user: user3,
  description: 'This product was total crap, avoid at all cost',
  rating: 1
})

product7.reviews.create!({
  user: user3,
  description: 'Wow best thing the in world, but a bit pricey',
  rating: 9
})

product3.reviews.create!({
  user: user4,
  description: 'Acceptable product',
  rating: 5
})

puts "DONE!"
