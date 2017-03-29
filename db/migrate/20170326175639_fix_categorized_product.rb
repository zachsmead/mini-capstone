class FixCategorizedProduct < ActiveRecord::Migration[5.0]
  def change
  	remove_column :categorized_products, :integer, :string
  	remove_column :categorized_products, :product_id, :string
  	add_column :categorized_products, :product_id, :integer
  	remove_column :categorized_products, :category_id, :string
  	add_column :categorized_products, :category_id, :integer
  end
end
