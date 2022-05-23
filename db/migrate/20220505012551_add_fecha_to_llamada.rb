class AddFechaToLlamada < ActiveRecord::Migration[5.2]
  def change
    add_column :llamadas, :fecha, :date
    add_index :llamadas, :fecha
  end
end
