class PillowsController < ApplicationController
def index
  @pillows = Pillow.all
end

end
