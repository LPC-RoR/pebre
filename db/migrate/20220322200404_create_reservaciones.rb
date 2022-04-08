class CreateReservaciones < ActiveRecord::Migration[5.2]
  def change
    create_table :reservaciones do |t|
      t.date :fecha
      t.string :servicio
      t.string :zona
      t.string :mesa
      t.integer :pasajeros
      t.string :hora
      t.string :anombre
      t.string :n_contacto

      t.timestamps
    end
    add_index :reservaciones, :fecha
  end
end
