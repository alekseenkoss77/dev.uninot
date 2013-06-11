class Order < ActiveRecord::Base
  attr_accessible :name, :role, :group, :body, :email
  validates :name, :role, :body, :presence => true
end
