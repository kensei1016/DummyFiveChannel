class SureadsController < ApplicationController
  def index
    @sureads = Suread.all
  end

  def show
    @suread = Suread.find(params[:id])
  end

  def create
    binding.pry
    category = Category.find(params[:category_id])
    @suread = current_user.sureads.build(suread_params)
    @suread.categories << category
    if @suread.save
      redirect_to category_path(category)
    else
    end
  end

  def search
    @sureads = @q.result(distinct: true).reverse_order
  end

  def suread_params
    params.require(:suread).permit(:title, :comment)
  end
end
