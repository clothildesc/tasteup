class PreparationStep < ApplicationRecord
  belongs_to :recipe
  validates :step_number, presence: true
  validates :instruction, presence: true
end
