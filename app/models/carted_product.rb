class CartedProduct < ApplicationRecord
	belongs_to :user
	belongs_to :product
	belongs_to :order, optional: true

	def set_status_purchased
		self.status = "purchased"
	end

	def set_order_id(order)
		self.order_id = order.id
	end

end
