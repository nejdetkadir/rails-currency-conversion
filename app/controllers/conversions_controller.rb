# app/controllers/conversions_controller.rb
class ConversionsController < ApplicationController
  before_action :get_conversations, only: [:new, :index, :create]
  before_action :set_conversion, only: [:destroy]

  def index; end

  def new
    @conversion = Conversion.new
  end

  def create
    @conversion = Conversion.new(conversion_params)

    if @conversion.save
      flash[:notice] = "Conversion was successfully created."
      redirect_to new_conversion_path
    else
      render :new
    end
  end

  def destroy
    @conversion.destroy

    flash[:notice] = "Conversion was successfully destroyed."
    redirect_to new_conversion_path
  end

  private

  def conversion_params
    params.require(:conversion).permit(:currency_id, :to_id)
  end

  def get_conversations
    @conversions = Conversion.page(params[:page])
  end

  def set_conversion
    @conversion = Conversion.find(params[:id])
  end
end
