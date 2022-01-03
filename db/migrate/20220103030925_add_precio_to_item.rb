class AddPrecioToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :precio, :decimal
  end
end
