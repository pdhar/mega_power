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
  
  # PUT /parts/1
  # PUT /parts/1.json
  def update
    @part = Part.find(params[:id])

    respond_to do |format|
      if @part.update_attributes(params[:part])
        format.html { redirect_to inventory_path, notice: 'Part was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "index" }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
    
  end
 
  
end
