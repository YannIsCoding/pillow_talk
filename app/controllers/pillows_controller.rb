class PillowsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

def index
  @pillows = Pillow.all
end

end
