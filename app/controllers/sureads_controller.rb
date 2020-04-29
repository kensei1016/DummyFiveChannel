class SureadsController < ApplicationController
  def index
    @sureads = Suread.all
  end

  def show
  end

  def create
  end
end
