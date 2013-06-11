class Desk < ActiveRecord::Base
  attr_accessible :title, :body, :group_id, :user_id
  belongs_to :group
  belongs_to :user
end
