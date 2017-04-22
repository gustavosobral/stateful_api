# Main model states API serializer
class StateSerializer < ActiveModel::Serializer
  attributes :id, :name, :order
end
