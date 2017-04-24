# Application main model
class Model < ApplicationRecord
  has_many :states, dependent: :destroy

  validates :name, presence: true
end
