class AddHorarioToMesa < ActiveRecord::Migration[5.2]
  def change
    add_column :mesas, :horario, :string
    add_index :mesas, :horario
  end
end
