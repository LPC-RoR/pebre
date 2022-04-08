class AddTurnoToCierre < ActiveRecord::Migration[5.2]
  def change
    add_column :cierres, :turno, :string
  end
end
