class ServicesController < ApplicationController
  before_filter :authenticate_user!
  # GET /services
  # GET /services.json
  def index
    @services = Service.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service = Service.find(params[:id])
    @servicepartsments = @service.servicepartsments
    @parts = @service.parts
    @labours = @service.labours
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(params[:service])
    #sum up the total cost of the parts and update service_cost
    
    #@service.service_cost ||= @service.parts.sum(:part_cost).to_i 
    #Rails.logger.debug("My object: #{@service.parts.inspect}")
    #Rails.logger.debug("Part Cost: #{@service.parts.count}")
    @service.service_cost = 0.00
    @service.total_parts_cost = 0.00
    @service.total_labour_cost = 0.00
    
    @service.parts.each do |v|
      @service.service_cost += v.part_cost
      @service.total_parts_cost += v.part_cost
    end
    
    @service.labours.each do |v|
      @service.service_cost += v.labour_cost_per_hr
      @service.total_labour_cost += v.labour_cost_per_hr
    end
    
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @service = Service.find(params[:id])
    
    @service.service_cost = 0.00
    @service.total_parts_cost = 0.00
    @service.total_labour_cost = 0.00
    
    @service.parts.each do |v|
      @service.service_cost += v.part_cost
      @service.total_parts_cost += v.part_cost
    end
    
    @service.labours.each do |v|
      @service.service_cost += v.labour_cost_per_hr
      @service.total_labour_cost += v.labour_cost_per_hr
    end
    
    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end
  
  def update_individual_parts
    
    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end
end
