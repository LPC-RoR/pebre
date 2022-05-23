class CreateResMesas < ActiveRecord::Migration[5.2]
  def change
    create_table :res_mesas do |t|
      t.integer :reserva_id
      t.integer :mesa_id

      t.timestamps
    end
    add_index :res_mesas, :reserva_id
    add_index :res_mesas, :mesa_id
  end
end
