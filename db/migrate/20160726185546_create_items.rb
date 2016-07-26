class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :img
      t.decimal :price

      t.timestamps null: false
    end
  end
end
