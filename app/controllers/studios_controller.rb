class StudiosController < ApplicationController
  def show
    @clays = Clay.all
    
    render
  end
end
