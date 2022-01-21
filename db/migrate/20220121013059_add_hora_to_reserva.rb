class AddHoraToReserva < ActiveRecord::Migration[5.2]
  def change
    add_column :reservas, :hora, :string
  end
end
