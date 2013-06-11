# coding: utf-8
class CreateTrashInfo < ActiveRecord::Migration
  def up
    User.create!(
      :email => "styford@gmail.com",
      :name  => "Сызганов Степан",
      :role  => "admin",
      :password => "8dg#1u(GSDkd",
      :password_confirmation => "8dg#1u(GSDkd"
    )
  end

  def down
  end
end
