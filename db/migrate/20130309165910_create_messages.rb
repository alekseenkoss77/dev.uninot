# coding: utf-8
class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      # текст сообщения
      t.string :body
      # группа, которой отправится смс
      t.integer :group_id
      # отправитель - староста или преподаватель
      t.integer :user_id
      # отдельный студент, если есть
      t.integer :student_id
      t.timestamps
    end
  end
end
