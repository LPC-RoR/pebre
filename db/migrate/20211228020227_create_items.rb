class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :orden
      t.string :item
      t.boolean :activo
      t.integer :grupo_id

      t.timestamps
    end
    add_index :items, :orden
    add_index :items, :grupo_id
  end
end
