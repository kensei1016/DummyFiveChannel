class ApplicationController < ActionController::Base
  before_action :set_search_suread

  private
  def set_search_suread
    @q = Suread.ransack(params[:q])
  end
end
