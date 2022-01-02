class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :area
      t.string :acceso
      t.string :proyecto_id
#      t.string :owner_class
#      t.integer :owner_id

      t.timestamps
    end
#    add_index :areas, :owner_class
#    add_index :areas, :owner_id
  end
end
