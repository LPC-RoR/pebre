class CreateAppDocumentos < ActiveRecord::Migration[5.2]
  def change
    create_table :app_documentos do |t|
      t.string :documento
      t.boolean :publico
      t.string :owner_class
      t.integer :owner_id

      t.timestamps
    end
    add_index :app_documentos, :owner_class
    add_index :app_documentos, :owner_id
  end
end
