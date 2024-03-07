class PreparationStep < ApplicationRecord
  include Abyme::Model
  belongs_to :recipe
  # validates :step_number, presence: true
  validates :instruction, presence: true
end
