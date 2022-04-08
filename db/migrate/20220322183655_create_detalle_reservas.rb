class CreateDetalleReservas < ActiveRecord::Migration[5.2]
  def change
    create_table :detalle_reservas do |t|
      t.date :fecha
      t.string :servicio
      t.string :salon
      t.string :mesa
      t.string :horario

      t.timestamps
    end
    add_index :detalle_reservas, :fecha
    add_index :detalle_reservas, :servicio
    add_index :detalle_reservas, :salon
    add_index :detalle_reservas, :mesa
    add_index :detalle_reservas, :horario
  end
end
