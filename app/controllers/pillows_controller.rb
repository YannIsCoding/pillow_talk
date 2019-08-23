class PillowsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_pillow, only: [:edit, :update, :destroy]

  def index
    @pillows = Pillow.all
    @average_review = average_review
  end

  def show
    @pillow = Pillow.find(params[:id])
    @reviews = Review.where(params[:pillow_id])
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

  def edit
  end

  def update
    @pillow.update(pillow_params)
    redirect_to pillows_path(@pillow)
  end

  def destroy
    @pillow.destroy
    redirect_to pillows_path
  end

  private

  def average_review
    reviews = Review.where(params[:pillow_id])
    review_sum = 0
    reviews.each do |review|
      review_sum += review.rating
    end
    review_sum / reviews.count
  end

  def find_pillow
    @pillow = Pillow.find(params[:id])
  end

  def pillow_params
    params.require(:pillow).permit(:address, :category, :name, :photo, :description)
  end
end
