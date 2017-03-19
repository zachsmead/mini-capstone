class ChangeDecimal < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :supplier_id, :integer
  end
end
