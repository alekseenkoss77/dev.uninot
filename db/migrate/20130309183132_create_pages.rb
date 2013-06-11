# coding: utf-8
class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string  :name
      t.text    :body
      t.string  :slug
      t.text    :meta_description
      t.text    :meta_keywords
      t.text    :meta_title
      t.timestamps
    end
  end
end
