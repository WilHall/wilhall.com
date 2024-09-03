class TerrariumsController < ApplicationController
  layout 'wizard', only: [:new, :show]

  def index
    render
  end

  def new
    @terrarium = Terrarium.new
    render
  end

  def create
    params.require(:terrarium).permit(:customer_name, :customer_email)
    terrarium = Terrarium.new(
      customer_name: params[:terrarium][:customer_name],
      customer_email: params[:terrarium][:customer_email],
    )
    
    if terrarium.save
      redirect_to terrarium_path(terrarium.to_signed_global_id(expires_in: nil, for: 'sharing').to_s)
    else
      redirect_to new_terrarium_path
    end
  end

  def show
    params.permit(:id)

    @terrarium = GlobalID::Locator.locate_signed(params[:id], for: 'sharing')
    @terrarium_url = terrarium_url(params[:id])

    @selected_top_soil = params.dig(:terrarium, :top_soil_id).present? ? Soil.find(params.dig(:terrarium, :top_soil_id)) : nil
    @selected_bottom_soil = params.dig(:terrarium, :bottom_soil_id).present? ? Soil.find(params.dig(:terrarium, :bottom_soil_id)) : nil
    @selected_decoration = params.dig(:terrarium, :decoration_id).present? ? Decoration.find(params.dig(:terrarium, :decoration_id)) : nil
    @selected_first_succulent = params.dig(:terrarium, :first_succulent_id).present? ? Succulent.find(params.dig(:terrarium, :first_succulent_id)) : nil
    @selected_second_succulent = params.dig(:terrarium, :second_succulent_id).present? ? Succulent.find(params.dig(:terrarium, :second_succulent_id)) : nil
    @selected_third_succulent = params.dig(:terrarium, :third_succulent_id).present? ? Succulent.find(params.dig(:terrarium, :third_succulent_id)) : nil

    if @terrarium.present?
      render
    else
      redirect_to new_terrarium_path
    end
  end

  def update
    params.permit(:id, :decoration_id, :first_succulent_id, :second_succulent_id, :third_succulent_id, :top_soil_id, :bottom_soil_id)

    @terrarium = GlobalID::Locator.locate_signed(params[:id], for: 'sharing')

    if @terrarium.present?
      @terrarium.update!(
        decoration_id: params[:decoration_id],
        first_succulent_id: params[:first_succulent_id],
        second_succulent_id: params[:second_succulent_id],
        third_succulent_id: params[:third_succulent_id],
        top_soil_id: params[:top_soil_id],
        bottom_soil_id: params[:bottom_soil_id]
      )
      redirect_to "https://buy.stripe.com/aEU4gF5u6bEaeAg6oy", allow_other_host: true
    else
      redirect_to new_terrarium_path
    end
  end
end
