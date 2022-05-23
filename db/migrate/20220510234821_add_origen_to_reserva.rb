class AddOrigenToReserva < ActiveRecord::Migration[5.2]
  def change
    add_column :reservas, :origen, :string
    add_index :reservas, :origen
  end
end
