class ResponsesController < ApplicationController
  def create
    @suread = Suread.find(params[:suread_id])
    @response = @suread.responses.build(response_params)
    # １．ユーザがログインand名前を入力　       →　入力した名前で登録
    # ２．ユーザがログインand名前を入力しない　  →　ユーザ名で登録
    # ３．未ログインand名前を入力　             →　入力した名前で登録
    # ４．未ログインand名前を入力しない　       →　「名無しさん」で登録
    if user_signed_in?
      if response_params[:name].empty?
        @response.name = current_user.name
      end
    else
      if response_params[:name].empty?
        @response.name = "名無しさん"
      end
    end

    if @response.save
      redirect_to suread_path(@suread)
    else
      @suread = Suread.find(params[:suread_id])
      render 'sureads/show'
    end
  end

  private
  def response_params
    params.require(:response).permit(:name, :comment)
  end
end
