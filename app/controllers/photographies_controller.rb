class PhotographiesController < ApplicationController
  def show
    @portraits = Photo.where(category: :portrait)
    @landscapes = Photo.where(category: :landscape)
    @others = Photo.where(category: :other)
    render
  end
end
