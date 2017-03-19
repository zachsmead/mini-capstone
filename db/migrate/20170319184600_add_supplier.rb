class AddSupplier < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :supplier_id, :decimal
  end
end
