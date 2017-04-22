# Main model API serializer
class ModelSerializer < ActiveModel::Serializer
  attributes :id, :name, :current_state
  has_many :states
end
