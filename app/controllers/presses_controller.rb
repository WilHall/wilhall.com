class PressesController < ApplicationController
  def index
    @presses = Press.all
    render
  end
end
