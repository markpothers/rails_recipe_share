# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# ActiveRecord::Migration.drop_table(:likes)
# ActiveRecord::Migration.drop_table(:follows)
# ActiveRecord::Migration.drop_table(:friendships)
# ActiveRecord::Migration.drop_table(:recipes)
# ActiveRecord::Migration.drop_table(:chefs)
# ActiveRecord::Migration.drop_table(:ingredients)
# ActiveRecord::Migration.drop_table(:ingredient_uses)
# ActiveRecord::Migration.create_table(:likes)
# ActiveRecord::Migration.create_table(:follows)
# ActiveRecord::Migration.create_table(:friendships)
# ActiveRecord::Migration.create_table(:recipes)
# ActiveRecord::Migration.create_table(:chefs)
# ActiveRecord::Migration.create_table(:ingredients)
# ActiveRecord::Migration.create_table(:ingredient_uses)

Like.destroy_all
Follow.destroy_all
Friendship.destroy_all
Ingredient_Use.destroy_all
Recipe.destroy_all
Chef.destroy_all
Ingredient.destroy_all


500.times do
    Ingredient.create(name: Faker::Food.ingredient)
end

100.times do
    Chef.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Books::CultureSeries.planet, e_mail:Faker::Internet.email, country: Faker::Address.country)
end

500.times do
    Recipe.create(name: Faker::Food.dish, chef_id: Chef.all.sample.id)
end

200.times do
    Friendship.create(requestor_id: Chef.all.sample.id, acceptor_id: Chef.all.sample.id)
end

200.times do
    Follow.create(followee_id: Chef.all.sample.id, follower_id: Chef.all.sample.id)
end

200.times do
    Like.create(chef_id: Chef.all.sample.id, recipe_id: Recipe.all.sample.id)
end

5.times do
    Recipe.all.each do |recipe|
        string = Faker::Food.measurement
        array = string.split(" ")
        IngredientUse.create(recipe_id: recipe.id, ingredient_id: Ingredient.all.sample.id, quantity: array[0], unit: array[1])
    end
end





