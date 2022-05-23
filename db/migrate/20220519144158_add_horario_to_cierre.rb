class AddHorarioToCierre < ActiveRecord::Migration[5.2]
  def change
    add_column :cierres, :horario, :string
    add_index :cierres, :horario
  end
end
