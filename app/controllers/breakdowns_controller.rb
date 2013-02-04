class BreakdownsController < ApplicationController
  before_filter :authenticate_user!
  # GET /breakdowns
  # GET /breakdowns.json
  def index
    @breakdowns = Breakdown.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @breakdowns }
    end
  end

  # GET /breakdowns/1
  # GET /breakdowns/1.json
  def show
    @breakdown = Breakdown.find(params[:id])
    
    @parts = @breakdown.parts
    @labours = @breakdown.labours
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @breakdown }
    end
  end

  # GET /breakdowns/new
  # GET /breakdowns/new.json
  def new
    @breakdown = Breakdown.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @breakdown }
    end
  end

  # GET /breakdowns/1/edit
  def edit
    @breakdown = Breakdown.find(params[:id])
  end

  # POST /breakdowns
  # POST /breakdowns.json
  def create
    @breakdown = Breakdown.new(params[:breakdown])

    @breakdown.breakdown_cost = 0.00
    @breakdown.total_parts_cost = 0.00
    @breakdown.total_labour_cost = 0.00
    
    @breakdown.parts.each do |v|
      @breakdown.breakdown_cost += v.part_cost
      @breakdown.total_parts_cost += v.part_cost
    end
    
    @breakdown.labours.each do |v|
      @breakdown.breakdown_cost += v.labour_cost_per_hr
      @breakdown.total_labour_cost += v.labour_cost_per_hr
    end
    
    respond_to do |format|
      if @breakdown.save
        format.html { redirect_to @breakdown, notice: 'Breakdown was successfully created.' }
        format.json { render json: @breakdown, status: :created, location: @breakdown }
      else
        format.html { render action: "new" }
        format.json { render json: @breakdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /breakdowns/1
  # PUT /breakdowns/1.json
  def update
    @breakdown = Breakdown.find(params[:id])

    @breakdown.breakdown_cost = 0.00
    @breakdown.total_parts_cost = 0.00
    @breakdown.total_labour_cost = 0.00
    
    @breakdown.parts.each do |v|
      @breakdown.breakdown_cost += v.part_cost
      @breakdown.total_parts_cost += v.part_cost
    end
    
    @breakdown.labours.each do |v|
      @breakdown.breakdown_cost += v.labour_cost_per_hr
      @breakdown.total_labour_cost += v.labour_cost_per_hr
    end
    
    respond_to do |format|
      if @breakdown.update_attributes(params[:breakdown])
        format.html { redirect_to @breakdown, notice: 'Breakdown was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @breakdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breakdowns/1
  # DELETE /breakdowns/1.json
  def destroy
    @breakdown = Breakdown.find(params[:id])
    @breakdown.destroy

    respond_to do |format|
      format.html { redirect_to breakdowns_url }
      format.json { head :no_content }
    end
  end
end
