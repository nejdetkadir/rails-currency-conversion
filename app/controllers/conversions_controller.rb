# app/controllers/conversions_controller.rb
class ConversionsController < ApplicationController
  def index
    @conversions = Conversion.page(params[:page])
  end

  def new; end
end
