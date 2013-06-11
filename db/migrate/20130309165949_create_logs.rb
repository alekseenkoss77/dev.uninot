# coding: utf-8 
class CreateLogs < ActiveRecord::Migration
  def change
    # таблица для логирования всего и вся
    create_table :logs do |t|
      t.integer :message_id
      t.integer :user_id
      t.integer :group_id
      t.text :body
      t.timestamps
    end
  end
end
