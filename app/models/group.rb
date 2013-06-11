# coding: utf-8
class Group < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :students
  has_many :users
  has_many :desk
end
