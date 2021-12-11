# app/controllers/conversions_controller.rb
class ConversionsController < ApplicationController
  def index
    @conversions = Conversion.all
  end

  def new; end
end
