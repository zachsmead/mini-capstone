class AddQuantityToCarted < ActiveRecord::Migration[5.0]
  def change
  	add_column :carted_products, :quantity, :integer
  end
end
