# Rails 5 base model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
