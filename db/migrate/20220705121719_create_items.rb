class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.boolean :real
      t.text :description
      t.timestamps
    end
    add_index :items, :name
    add_index :items, :price
  end
end
