class AddServicioToMesa < ActiveRecord::Migration[5.2]
  def change
    add_column :mesas, :servicio, :string
    add_index :mesas, :servicio
  end
end
