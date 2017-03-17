class ProductsController < ApplicationController

	def products
		@title = "Products:"
		@products = Product.all
	end

	def new
	end

	def create
		@new_product = Product.create(name:params[:name], price:params[:price],
			image:params[:image], description:params[:description], in_stock:params[:in_stock])

		redirect_to "/products/#{@new_product.id}"


		flash[:success] = "Product created!"
	end

	def index
		@products = Product.all
	end

	def show
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
	end

	def edit
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
	end

	def update
		@product = Product.find_by(id: params[:id])
	
		@product.update(name: params[:name], price:params[:price], image:params[:image], description:params[:description],
			in_stock:params[:in_stock])

		redirect_to "/products/#{@product.id}"

		flash[:info] = "Product updated!"
	end

	def destroy
		@product = Product.find_by(id: params[:id])

		@product.destroy

		redirect_to "/products"

		flash[:danger] = "Product deleted!"
	end

end
