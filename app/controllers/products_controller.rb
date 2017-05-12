class ProductsController < ApplicationController
	def add_to_cart
		@product = Product.find(params[:id])
		redirect_to :back
		flash[:notice] = "测试加入购物车成功"
	end
	
	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to jobs_path
		else
			render :new
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @prdouct.update(product_params)
			redirect_to jobs_path
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to jobs_path
	end

	private

	def product_params
		params.require(:product).permit(:title, :dexcription, :price, :quantity, :image)
	end
end
