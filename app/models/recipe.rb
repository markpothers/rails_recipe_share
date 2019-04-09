class Recipe < ApplicationRecord
  belongs_to :chef

  has_many :ingredient_uses
  has_many :ingredients, through: :ingredient_uses

  has_many :likes
  has_many :likers, :class_name => "Like", :foreign_key => "recipe_id"

end
