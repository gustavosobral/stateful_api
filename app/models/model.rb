# Application main model
class Model < ApplicationRecord
  has_many :states

  validates :name, presence: true
end
