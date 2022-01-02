class AddEstadoToProyecto < ActiveRecord::Migration[5.2]
  def change
    add_column :proyectos, :estado, :string
    add_index :proyectos, :estado
  end
end
