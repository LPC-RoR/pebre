class CreateTandas < ActiveRecord::Migration[5.2]
  def change
    create_table :tandas do |t|
      t.string :turno
      t.integer :orden
      t.string :horario
      t.integer :capacidad
      t.boolean :cerrado

      t.timestamps
    end
    add_index :tandas, :turno
    add_index :tandas, :orden
    add_index :tandas, :horario
  end
end
