class StudiosController < ApplicationController
  def show
    params.permit(:base_glaze, :primary_color)

    @clays = Clay.all
    @base_glaze_options = Glaze.all.pluck(Arel.sql("identifier || ' ' || name"))
    @primary_color_options = Glaze.primary_colors.keys.map(&:titleize)

    @selected_base_glaze = params[:base_glaze]
    @selected_primary_color = params[:primary_color]

    @glazes = Glaze.all
    @glaze_combinations = GlazeCombination.all

    if @selected_base_glaze.present?
      identifier, name = @selected_base_glaze.split(' ', 2)
      @glazes = @glazes.where(identifier: identifier)
      @glaze_combinations = @glaze_combinations.joins(:first_glaze).where(first_glaze: {identifier: identifier})
    end

    if @selected_primary_color.present?
      @glazes = @glazes.where(primary_color: @selected_primary_color.downcase)
      @glaze_combinations = @glaze_combinations.where(primary_color: @selected_primary_color.downcase)
    end

    render
  end
end
