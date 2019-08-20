class PillowsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @pillows = Pillow.all
  end

  def new
    @pillow = Pillow.new
  end

  def create
    @pillow = Pillow.new(pillow_params)
    if @pillow.save
      redirect_to pillows_path
    else
      render :new
    end
  end

  private

  def pillow_params
    params.require(:pillow).permit(:address, :category, :photo)
  end
end
