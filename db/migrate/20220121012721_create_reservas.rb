class CreateReservas < ActiveRecord::Migration[5.2]
  def change
    create_table :reservas do |t|
      t.string :anombre
      t.datetime :fecha
      t.string :n_personas
      t.string :n_contacto
      t.string :indicaciones

      t.timestamps
    end
  end
end
