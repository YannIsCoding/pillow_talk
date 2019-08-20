class PillowsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @pillows = Pillow.all
  end

  def show
    @pillow = Pillow.find(params[:id])
  end

  def new
    @pillow = Pillow.new
  end

  def create
    @pillow = Pillow.new(pillow_params)
    # @pillow.user_id = current_user.id
    if @pillow.save
      redirect_to pillows_path
    else
      render :new
    end
  end

  def destroy
      @pillow = Pillow.find(params[:id])
      @pillow.destroy
      redirect_to pillows_path
  end

  private

  def pillow_params
    params.require(:pillow).permit(:address, :category, :name, :photo, :description)
  end
end
