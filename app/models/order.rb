class Order < ApplicationRecord
	belongs_to :user
	has_many :products, through: :carted_products
	has_many :carted_products

	validates :subtotal, presence: true, numericality: true, numericality: { greater_than: 0 }
	validates :tax, presence: true, numericality: true, numericality: { greater_than: 0 }
	validates :total, presence: true, numericality: true, numericality: { greater_than: 0 }

	 def calculate_subtotal(carted_products)
	 	# return price * quantity
	 	@subtotal = []

	 	carted_products.each do |carted_product|
	 		@subtotal << (carted_product.product.price * carted_product.quantity)
	 	end

	 	self.subtotal = @subtotal.reduce(:+)
	 end

	def calculate_tax
		self.tax = subtotal * 0.10
	end

	def calculate_total
		self.total = subtotal + tax
	end

	# def set_to_purchased(carted_products)
	# 	carted_products.each do |carted_product|
	# 		carted_product.status = "purchased"
	# 	end
	# end

	# def set_order_id(carted_products)
	# 	carted_products.each do |carted_product|
	# 		carted_product.order_id = self.id
	# 	end
	# end
end
