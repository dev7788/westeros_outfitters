class CreateOrderItemsTable < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
     t.integer :item_id
     t.integer :order_id
  end
  add_index :order_items, [:item_id, :order_id]
  end
end
