class CreateLlamadas < ActiveRecord::Migration[5.2]
  def change
    create_table :llamadas do |t|
      t.string :anombre
      t.string :contacto
      t.string :hora
      t.integer :paxs
      t.boolean :anulada

      t.timestamps
    end
  end
end
