class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @categories = @category.categories.order(created_at: :desc)
  end

end
