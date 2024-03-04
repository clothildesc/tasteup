class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  validates :name, presence: true
end
