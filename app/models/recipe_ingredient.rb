class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity_value, presence: true
  validates :quantity_unit, presence: true
end
