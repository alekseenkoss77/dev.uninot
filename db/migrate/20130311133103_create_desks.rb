class CreateDesks < ActiveRecord::Migration
  def change
    create_table :desks do |t|
      t.string  :title
      t.text    :body
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end
end
