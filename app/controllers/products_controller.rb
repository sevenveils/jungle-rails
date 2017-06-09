class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @new_review = Review.new
  end

  # private
    # Never trust parameters from the scary internet, only allow the white list through.
    # def product_params
    #   params.require(:product).permit(:)
    # end


end

