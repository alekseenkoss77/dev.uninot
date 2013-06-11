class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string  :name
      t.string  :group
      t.string  :role
      t.text    :body
      t.timestamps
    end
  end
end
