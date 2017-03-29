class OrdersController < ApplicationController
	def create

		# product = Product.find_by(id: params[:product_id])

		 # quantity = params[:quantity].to_i
		 # subtotal = (quantity * product.price.to_f)
		 # tax = (subtotal * 0.1)
		 # total = (subtotal + tax)

		# order = Order.create(user_id: session[:user_id],
  #     product_id: params[:product_id],
  #     quantity: quantity,
  #     subtotal: subtotal,
  #     tax: tax,
  #     total: total
  #   )

		# stock = (product.stock - quantity)

  #   product.update(
  #   	stock: stock
  #   )
		

  #   redirect_to "/orders/#{order.id}"

  @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

  puts "*" * 100
  p @products
  puts "*" * 100

  @order = Order.new(user_id: current_user.id)
  @order.calculate_subtotal(@carted_products)
  @order.calculate_tax
  @order.calculate_total

  @order.save

  if @order.save
		@carted_products.each do |carted_product|
			carted_product.set_status_purchased
			carted_product.set_order_id(@order)
			carted_product.save
			product = carted_product.product
			product.update_stock(carted_product)
			product.save
		end
    redirect_to "/orders/#{@order.id}"
  else
  	flash[:danger] = "u cant afford that ya goofball"
  	redirect_to "/orders#{@order.id}"
  end


	end


	def show
		@order = Order.find_by(id: params[:id])
		@created_at = @order.created_at
	end

end
