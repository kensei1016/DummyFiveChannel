class SureadsController < ApplicationController
  def index
    @sureads = Suread.all
  end

  def show
    @suread = Suread.find(params[:id])
  end

  def create
  end
end
