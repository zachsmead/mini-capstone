class AddNumberOfProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :suppliers, :number_of_products, :integer
  end
end
