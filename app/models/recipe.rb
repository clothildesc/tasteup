class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :preparation_steps, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  has_many :favorites, dependent: :destroy

  # Validations
  validates :title, presence: true
  validates :difficulty, presence: true
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :number_of_servings, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
