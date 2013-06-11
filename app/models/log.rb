# coding: utf-8
class Log < ActiveRecord::Base
  attr_accessible :message_id, :user_id, :group_id, :body
end
