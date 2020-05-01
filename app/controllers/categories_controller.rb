class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @suread = Suread.new
    @suread.categories << @category
  end
end
