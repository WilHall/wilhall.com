class WritingsController < ApplicationController
  def index
    @writings = Writing.all
    render
  end
end
