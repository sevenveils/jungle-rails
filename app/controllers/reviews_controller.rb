class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = current_user.id

    # Another option, but results in `no such method reviews for nil:NilClass` if the product doesn't exist
    # @product = product.find(params[:product_id])
    # @review = @product.reviews.new(review_params)

    if @review.save
      redirect_to @review.product, notice: 'Review was successfully created.'
    else
      redirect_to @review.product, notice: 'Failed to create the review'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end

