# Application main model states
class State < ApplicationRecord
  belongs_to :model

  scope :ordered, (-> { order(:order) })

  validates :model, presence: true
  validates :name,  presence: true
  validates :order, presence: true
end
