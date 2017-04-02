class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :authenticate_admin!, except: [:index, :show, :search]

	def index
		sort = params[:sort]
		order = params[:order]
		showing = params[:showing]
		@category = params[:category]

		if sort && order
			@products = Product.all.order(sort => order)
		elsif showing
			@products = Product.where("price < ?", 2.00)
		elsif @category
			@products = Category.find_by(id: @category).products
		else
			@products = Product.all
		end

	end

	def new
		@product = Product.new
		@product_image = Image.new
	end

	def create

		@product = Product.new(
			name:params[:name], 
			price:params[:price], 
			description:params[:description], 
			stock:params[:stock], 
			supplier_id:params[:product][:supplier_id]
		)

		@product_image = Image.new(src: params[:src], product_id: @product.id)

		if @product.save
			flash[:success] = "Product created!"
			@product_image.save
			redirect_to "/products/#{@product.id}"
		else
			flash[:danger] = "Product could not be created!"
			render "new.html.erb"
		end

	end



	def show
		product_id = params[:id]

		@categories = Category.all

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
	
		@product.name = params[:name],
		@product.price = params[:price],
		@product.description = params[:description],
		@product.stock = params[:stock] || 0,
	  @product.supplier_id = params[:product][:supplier_id]
		
		if @product.save
			flash[:info] = "Product updated!"
			@supplier = Supplier.find_by(id: params[:product][:supplier_id])
			@supplier.update(
				number_of_products: @supplier.products.length
			)

			redirect_to "/products/#{@product.id}"
		else
			flash[:danger] = "Product could not be updated!"

			render 'edit.html.erb'
		end


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
		render 'index.html.erb'
	end

end
