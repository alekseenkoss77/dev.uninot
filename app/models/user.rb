# coding: utf-8
class User < ActiveRecord::Base
  ROLES = ['admin', 'warden', 'teacher']
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :set_role

  attr_accessible :email, :password, :password_confirmation, :remember_me, :telephone, :name, :role, :group_id
  has_many   :desk
  belongs_to :group

  def update_with_password(params={}) 
    if params[:password].blank? 
      params.delete(:password) 
      params.delete(:password_confirmation) if params[:password_confirmation].blank? 
    end 
    update_attributes(params) 
  end

  def set_role
    if self.group_id and self.role?('warden')
      self.role = "warden"
    elsif self.role?("teacher")
      self.role = "teacher"
    end
  end

  def role_to_human
    if self.admin?
      return "Администратор"
    end
    if self.warden?
      return "Староста"
    end
    if self.teacher?
      return "Преподаватель"
    end
  end

  def role?(role)
    self.role == role 
  end

  # администратор?
  def admin?
    self.role == 'admin'
  end

  # преподаватель?
  def teacher?
    self.role == 'teacher'
  end

  # староста?
  def warden?
    self.role == 'warden'
  end

  # all of admin
  def self.admins
    where(:role => "admin")
  end
end
