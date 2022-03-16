class CreateCierres < ActiveRecord::Migration[5.2]
  def change
    create_table :cierres do |t|
      t.date :fecha

      t.timestamps
    end
    add_index :cierres, :fecha
  end
end
