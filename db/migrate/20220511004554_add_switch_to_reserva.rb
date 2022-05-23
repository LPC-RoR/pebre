class AddSwitchToReserva < ActiveRecord::Migration[5.2]
  def change
    add_column :reservas, :switch, :boolean
    add_index :reservas, :switch
  end
end
