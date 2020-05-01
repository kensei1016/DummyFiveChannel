class SureadsController < ApplicationController
  def index
    @sureads = Suread.all.reverse_order
  end

  def show
    @suread = Suread.find(params[:id])
  end

  def create
    @suread = current_user.sureads.build(suread_params)

    category_ids = params[:suread][:category_ids]

    # 配列の最初の要素は空で来るためsliceする
    category_ids.slice(1..-1).each do |category_id|
      unless @suread.categories.exists?(category_id)
        @suread.categories << Category.find(category_id)
      end
    end

    if @suread.save
      redirect_to sureads_path
    else
    end
  end

  def search
    @sureads = @q.result(distinct: true).reverse_order
  end

  def suread_params
    params.require(:suread).permit(:title, :comment, :category_ids)
  end
end
