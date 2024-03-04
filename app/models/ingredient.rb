class Ingredient < ApplicationRecord
  belongs_to :recipe_ingredient
  validates :name, presence: true
end
