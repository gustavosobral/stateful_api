# User API response serializer
class UserSerializer < ActiveModel::Serializer
  attributes :id, :uid, :email, :name
end
