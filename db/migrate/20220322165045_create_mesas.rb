class CreateMesas < ActiveRecord::Migration[5.2]
  def change
    create_table :mesas do |t|
      t.string :zona
      t.string :mesa
      t.boolean :reserva
      t.integer :pasajeros

      t.timestamps
    end
    add_index :mesas, :zona
    add_index :mesas, :mesa
    add_index :mesas, :reserva
    add_index :mesas, :pasajeros
  end
end
