class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      # название группы
      t.string  :name
      t.timestamps
    end
  end
end
