# Application user model
class User < ApplicationRecord
  devise :database_authenticatable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
