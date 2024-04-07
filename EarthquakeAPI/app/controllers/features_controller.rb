# app/controllers/features_controller.rb
class FeaturesController < ApplicationController
  def index
    @features = Feature.all
    render json: @features
  end
end

