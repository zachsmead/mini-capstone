class Product < ApplicationRecord

	belongs_to :supplier
	has_many :images
	has_many :orders, through: :carted_products
	has_many :carted_products
	has_many :categories, through: :categorized_products
	has_many :categorized_products

	validates :name, presence: true, numericality: false
	validates :price, presence: true, numericality: true
	validates :stock, numericality: { greater_than: 0}
	validates :description, length: { maximum: 200 }


	def sale_message
		if price && price < 2
			return "Discount item!"
		else
			return "Everyday price!"
		end
	end

	def tax
		if price
			return price * 0.09
		end
	end

	def total
		if price && tax
			return price + tax
		end
	end

	def discount_style
		if price && price < 2
			return "discount"
		else
			return "everyday-price"
		end
	end

	def in_stock?
		if stock != nil && stock > 0
			return "#{stock} in stock"
		else
			return "Sorry, we're out right now!"
		end
	end

	def update_stock(carted_product)
		self.stock -= carted_product.quantity
	end

end
