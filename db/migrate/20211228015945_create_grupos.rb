class CreateGrupos < ActiveRecord::Migration[5.2]
  def change
    create_table :grupos do |t|
      t.integer :orden
      t.string :grupo
      t.boolean :activo

      t.timestamps
    end
    add_index :grupos, :orden
  end
end
