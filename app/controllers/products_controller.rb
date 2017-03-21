class ProductsController < ApplicationController

	def index
		sort = params[:sort]
		order = params[:order]
		showing = params[:showing]

		if sort && order
			@products = Product.all.order(sort => order)
		elsif showing
			@products = Product.where("price < ?", 2.00)
		else
			@products = Product.all
		end
	end

	def new
	end



	def create
		@new_product = Product.create(name:params[:name], price:params[:price], 
			image:params[:image], description:params[:description], in_stock:params[:in_stock], supplier_id:params[:supplier_id])

		redirect_to "/products/#{@new_product.id}"


		flash[:success] = "Product created!"
	end



	def show
		product_id = params[:id]
		if product_id == "random"
			@product = Product.all.sample
		else
			@product = Product.find_by(id: product_id)
		end
	end



	def edit
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
	end



	def update
		@product = Product.find_by(id: params[:id])

		puts "*" * 100
		puts params[:supplier_id]
		puts "*" * 100
	
		@product.update_attributes(
			name: params[:name],
			price: params[:price],
			image: params[:image],
			description: params[:description],
			in_stock: params[:in_stock],
			supplier_id: params[:supplier_id]
		)

		redirect_to "/products/#{@product.id}"

		flash[:info] = "Product updated!"
	end



	def destroy
		@product = Product.find_by(id: params[:id])

		@product.destroy

		redirect_to "/products"

		flash[:danger] = "Product deleted!"
	end

	def search
		search_term = params[:search_term]
		@products = Product.where("name ILIKE ?", "%#{search_term}%")
		render :index
	end

end
