# Application main model
class Model < ApplicationRecord
  validates :name, presence: true
end
