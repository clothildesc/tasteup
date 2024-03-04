class Category < ApplicationRecord
  belongs_to :recipe_category
  validates :name, presence: true
end
