# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Likes.destroy_all
Followers.destroy_all
Friendships.destroy_all
Ingredient_uses.destroy_all
Recipes.destroy_all
Ingredients.destroy_all
Chefs.destroy_all

1000.times do
    Ingredient.new(name: Faker::Food.ingredient)
end

100.times do
    Chef.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Books::CultureSeries.planet, e_mail:Faker::Internet.email, country: Faker::Address.country)
end

1000.times do
    Recipe.new(name: Faker::Food.dish, chef_id: Chef.all.sample)
end

1000.times do
    Friendship.new(requestor_id: Chef.all.sample, acceptor_id: Chef.all.sample)
end

1000.times do
    Follow.new(chef_id: Chef.all.sample, follower_id: Chef.all.sample)
end

10000.times do
    Like.new(chef_id: Chef.all.sample, recipe_id: Recipe.all.sample)
end

5.times do
    Recipe.all.each do |recipe|
        array = Faker::Food.measurement
        array.split(" ")
        Ingredient_Use.new(recipe_id: recipe.id, ingredeient_id: Ingredient.all.sample, quantity: array[0], unit: array[1])
    end
end





