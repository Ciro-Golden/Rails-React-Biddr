# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Auction.destroy_all
Bidding.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!("auctions")
ActiveRecord::Base.connection.reset_pk_sequence!("biddings")
ActiveRecord::Base.connection.reset_pk_sequence!("users")

super_user = User.create(
    username: "ciro",
    email: "ciro@gmail.com",
    password: "ciro"
)

5.times do
    User.create( username:Faker::Internet.username, email: Faker::Internet.email, password:"1")
end

users = User.all

25.times do
   a = Auction.create(
        title: Faker::Commerce.product_name,
        description: Faker::IDNumber.valid,
        price: Faker::Commerce.price(range = 5.0..20000.0, as_string = false),
        reserve: ["true", "false"].sample,
        expiry_date: Faker::Date.forward(45),
        user: users.sample
    )

    rand(1..15).times do
        a.biddings << Bidding.new(
            price: Faker::Commerce.price(range = 5.0..20000.0, as_string = false),
            user: users.sample
        )
    end
end

auctions = Auction.all
biddings = Bidding.all

p "Login with #{super_user.email} and password: #{super_user.password}"
p "Created #{users.count} user entries"
p "Created #{auctions.count} auction entries"
p "Created #{biddings.count} bid entries" 
