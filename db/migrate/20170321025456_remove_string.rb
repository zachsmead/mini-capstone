class RemoveString < ActiveRecord::Migration[5.0]
  def change
  	remove_column :images, :string, :string
  end
end
