class InventoryController < ApplicationController
  before_filter :authenticate_user!
  # GET /parts
  # GET /parts.json
  def index
    @parts = Part.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parts }
    end
  end
  
end
