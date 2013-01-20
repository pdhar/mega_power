class ComponentsController < ApplicationController
  # GET /components
  # GET /components.json
  def index
    @components = Component.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @components }
    end
  end

  # GET /components/1
  # GET /components/1.json
  def show
    @component = Component.find(params[:id])
    @componentmonths = @component.componentmonths
    
    @servicebymonths = @componentmonths.group_by { |t| t.date_month.beginning_of_month }
    @test = Component.where(:id => params[:id]).joins(:componentmonths => :services).select("componentmonths.date_month as date_month, sum(service_cost) as total_service_cost ").group("componentmonths.date_month")
    
    
    #@fmltest = @componentmonths.select("sum(total_service_cost) as abc").group_by { |t| t.date_month.beginning_of_month }
       
    #@test = Component.joins(:componentmonths => {:services => :parts}).select("component_id as component_id, sum(service_cost) as total_service_cost, sum(part_cost) as total_part_cost ").group("component_id, componentmonths.date_month")
    #.select("components.*, componentmonths.date_month as date_month")
    #Creating the data to display in the report
    
    @monthly_totals = []
    @servicebymonths.sort.reverse.each do |month, servicebymonths| 
      
      sum_total_services = 0
      sum_total_parts = 0
      sum_total_labour = 0
      
      for servicebymonth in servicebymonths
        sum_total_services += servicebymonth.total_service_cost
        sum_total_parts += servicebymonth.total_service_parts
        sum_total_labour += servicebymonth.total_service_labour
      end
      
      @monthly_totals.push({month: month, total_service_cost: sum_total_services, total_service_parts: sum_total_parts, total_service_labour: sum_total_labour})
      
       
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @component }
    end
  end

  # GET /components/new
  # GET /components/new.json
  def new
    @component = Component.new
    
    #@component.componentmonths.build
    #2.times { @component.componentmonths.build }
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @component }
    end
  end

  # GET /components/1/edit
  def edit
    @component = Component.find(params[:id])
  end

  # POST /components
  # POST /components.json
  def create
    @component = Component.new(params[:component])

    respond_to do |format|
      if @component.save
        format.html { redirect_to @component, notice: 'Component was successfully created.' }
        format.json { render json: @component, status: :created, location: @component }
      else
        format.html { render action: "new" }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /components/1
  # PUT /components/1.json
  def update
    @component = Component.find(params[:id])
    
    @component.total_service_cost = 0
    
   
     
    @component.componentmonths.each do |v|
      total_service_cost_per_date = 0
      total_service_parts_per_date = 0
      total_service_labour_per_date = 0
      
      v.services.each do |x|
        #Rails.logger.debug("Total Service Cost: #{x.service_cost}")
        @component.total_service_cost += x.service_cost
        total_service_cost_per_date += x.service_cost
        total_service_parts_per_date += x.total_parts_cost
        total_service_labour_per_date += x.total_labour_cost
      end
      
      #v.total_service_cost = total_service_cost_per_date + 50 
      #v.total_service_parts =  total_service_cost_per_date
      @component.componentmonths.find(v.id).update_attribute(:total_service_parts, total_service_parts_per_date )
      @component.componentmonths.find(v.id).update_attribute(:total_service_cost, total_service_cost_per_date )
      @component.componentmonths.find(v.id).update_attribute(:total_service_labour, total_service_labour_per_date )
      #Rails.logger.debug("######################Test Part Cost11111111111111: #{total_service_cost_per_date.to_d}")
      #Rails.logger.debug("######################Test Part Cost11111111111111: #{v.inspect}")
      # Rails.logger.debug("######################Test Part Cost11332132312311111: #{@component.componentmonths.find(v.id).inspect}")
    end
    #Rails.logger.debug("######################Test Part Cost: #{@component.inspect}")
    
    respond_to do |format|
      if @component.update_attributes(params[:component])
        format.html { redirect_to @component, notice: 'Component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.json
  def destroy
    @component = Component.find(params[:id])
    @component.destroy

    respond_to do |format|
      format.html { redirect_to components_url }
      format.json { head :no_content }
    end
  end
end
