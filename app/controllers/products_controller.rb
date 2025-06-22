class ProductsController < ApplicationController
    def index
        @products = Product.all
        @product = Product.new
    end

    def edit
        @product = Product.find(params[:id])
    end

    def create
        @product = Product.new(product_params)

        respond_to do |format|
            if @product.save
                format.html { redirect_to products_url, notice: "Product was successfully created" }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    private

    def product_params
        params.require(:product).permit(:name)
    end
    
end
