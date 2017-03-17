class UpdateData < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :description, :text
  	change_column :products, :price, :decimal
  	add_column :products, :in_stock, :boolean
  end
end
