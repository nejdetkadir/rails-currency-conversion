# app/controllers/conversions_controller.rb
class ConversionsController < ApplicationController
  def index
    @conversions = Conversion.page(params[:page])
  end

  def new
    @conversion = Conversion.new
  end

  def create
    @conversion = Conversion.new(conversion_params)

    if @conversion.save
      flash[:notice] = "Conversion was successfully created."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def conversion_params
    params.require(:conversion).permit(:currency_id, :to_id)
  end
end
