class AddAnuladaToReserva < ActiveRecord::Migration[5.2]
  def change
    add_column :reservas, :anulada, :boolean
  end
end
