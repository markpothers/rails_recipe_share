class Ingredient_Use < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
end
