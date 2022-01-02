class CreateProyectos < ActiveRecord::Migration[5.2]
  def change
    create_table :proyectos do |t|
      t.string :proyecto
      t.string :razon_social
      t.string :rut
      t.string :direccion

      t.timestamps
    end
  end
end
