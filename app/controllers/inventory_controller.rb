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
        flash[:error] = @part.errors.full_messages.to_sentence
        format.html { redirect_to inventory_path }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
    
  end
 
  def history
    @part = Part.find(params[:id])
    
    #@component = Component.new
    #@part.stockhistories.build(:change_value => -2, :description => "Pranav removed 2 items from inventory", :created_at => DateTime.now.beginning_of_day)
    #@part.stockhistories.build(:change_value => +2, :description => "Abbey added 2 items from inventory", :created_at => DateTime.now.beginning_of_day)
    #2.times { @component.componentmonths.build }
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @part }
    end
  end
end
