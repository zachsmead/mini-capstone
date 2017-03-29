class AddIntegerRemoveBooleanForProductsStock < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :in_stock, :boolean
  	add_column :products, :stock, :integer
  end
end
