class AddCodigoToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :codigo, :string
    add_index :items, :codigo
    add_column :items, :pesca_del_dia, :boolean
  end
end
