class Recipe < ApplicationRecord
  belongs_to :chef
  has_many :ingredient_uses
  has_many :ingredients, through: :ingredient_uses
  has_many :likes
  has_many :likers, :through => :likes, :source => :chef
end
