class SupplierDetails < ActiveRecord::Migration[5.0]
  def change
  	add_column :suppliers, :email, :string
  	add_column :suppliers, :phone, :string
  end
end
