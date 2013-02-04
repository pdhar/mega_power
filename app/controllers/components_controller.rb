class ComponentsController < ApplicationController
  before_filter :authenticate_user!
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
    #@test = Component.where(:id => params[:id]).joins(:componentmonths => :services).select("componentmonths.date_month as date_month, sum(service_cost) as total_service_cost ").group("componentmonths.date_month")
    
    
    #@fmltest = @componentmonths.select("sum(total_service_cost) as abc").group_by { |t| t.date_month.beginning_of_month }
       
    #@test = Component.joins(:componentmonths => {:services => :parts}).select("component_id as component_id, sum(service_cost) as total_service_cost, sum(part_cost) as total_part_cost ").group("component_id, componentmonths.date_month")
    #.select("components.*, componentmonths.date_month as date_month")
    #Creating the data to display in the report
    
    @monthly_totals = []
    @servicebymonths.sort.reverse.each do |month, servicebymonths| 
      
      sum_total_services = 0
      sum_total_service_parts = 0
      sum_total_service_labour = 0
      sum_total_breaks = 0
      sum_total_break_parts = 0
      sum_total_break_labour = 0
      sum_total_offhire_hrs = 0
      sum_total_total_hrs = 0
      
      for servicebymonth in servicebymonths
        sum_total_services += servicebymonth.total_service_cost
        sum_total_service_parts += servicebymonth.total_service_parts
        sum_total_service_labour += servicebymonth.total_service_labour
        sum_total_breaks += servicebymonth.total_break_cost
        sum_total_break_parts += servicebymonth.total_break_parts
        sum_total_break_labour += servicebymonth.total_break_labour
        
        sum_total_total_hrs += servicebymonth.total_hrs
        if servicebymonth.offhire_hrs > sum_total_offhire_hrs
          sum_total_offhire_hrs = servicebymonth.offhire_hrs  
        end 
        
      end
      
      @monthly_totals.push({month: month,
         total_service_cost: sum_total_services,
         total_service_parts: sum_total_service_parts,
         total_service_labour: sum_total_service_labour,
         total_break_cost: sum_total_breaks,
         total_break_parts: sum_total_break_parts,
         total_break_labour: sum_total_break_labour,
         total_offhire_hrs: sum_total_offhire_hrs,
         total_total_hrs: sum_total_total_hrs 
          })
      
       
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
    @index = 0
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
    @index = 0
  end

  # POST /components
  # POST /components.json
  def create
    @component = Component.new(params[:component])
    
    
    
    respond_to do |format|
      if @component.save
        
        
        @component.total_service_cost = 0
    
        @component.componentmonths.each do |v|
          total_service_cost_per_date = 0
          total_service_parts_per_date = 0
          total_service_labour_per_date = 0
          total_break_cost_per_date = 0
          total_break_parts_per_date = 0
          total_break_labour_per_date = 0
          total_hrs = v.offhire_hrs - v.onhire_hrs  
          
          
          v.services.each do |x|
            #Rails.logger.debug("Total Service Cost: #{x.service_cost}")
            @component.total_service_cost += x.service_cost
            total_service_cost_per_date += x.service_cost
            total_service_parts_per_date += x.total_parts_cost
            total_service_labour_per_date += x.total_labour_cost
          end
          
          v.breakdowns.each do |x|
            #Rails.logger.debug("Total Service Cost: #{x.service_cost}")
            @component.total_service_cost += x.breakdown_cost
            total_break_cost_per_date += x.breakdown_cost
            total_break_parts_per_date += x.total_parts_cost
            total_break_labour_per_date += x.total_labour_cost
            #Rails.logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Total Service Cost: #{total_break_cost_per_date}")
          end
          
          @component.componentmonths.find(v.id).update_attribute(:total_service_parts, total_service_parts_per_date )
          @component.componentmonths.find(v.id).update_attribute(:total_service_cost, total_service_cost_per_date )
          @component.componentmonths.find(v.id).update_attribute(:total_service_labour, total_service_labour_per_date )
          
          @component.componentmonths.find(v.id).update_attribute(:total_break_parts, total_break_parts_per_date )
          @component.componentmonths.find(v.id).update_attribute(:total_break_cost, total_break_cost_per_date )
          @component.componentmonths.find(v.id).update_attribute(:total_break_labour, total_break_labour_per_date )
          @component.componentmonths.find(v.id).update_attribute(:total_hrs, total_hrs )
          
          format.html { redirect_to @component, notice: 'Component was successfully created.' }
          format.json { render json: @component, status: :created, location: @component }
        end
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
    @index = 0
    
    #Rails.logger.debug("######################Test Part Cost: #{@component.inspect}")
    
    respond_to do |format|
      if @component.update_attributes(params[:component])
        @component.total_service_cost = 0
    
    @component.componentmonths.each do |v|
      total_service_cost_per_date = 0
      total_service_parts_per_date = 0
      total_service_labour_per_date = 0
      total_break_cost_per_date = 0
      total_break_parts_per_date = 0
      total_break_labour_per_date = 0
      total_hrs = v.offhire_hrs - v.onhire_hrs  
      
      v.services.each do |x|
        #Rails.logger.debug("Total Service Cost: #{x.service_cost}")
        @component.total_service_cost += x.service_cost
        total_service_cost_per_date += x.service_cost
        total_service_parts_per_date += x.total_parts_cost
        total_service_labour_per_date += x.total_labour_cost
      end
      
      v.breakdowns.each do |x|
        #Rails.logger.debug("Total Service Cost: #{x.service_cost}")
        @component.total_service_cost += x.breakdown_cost
        total_break_cost_per_date += x.breakdown_cost
        total_break_parts_per_date += x.total_parts_cost
        total_break_labour_per_date += x.total_labour_cost
        #Rails.logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Total Service Cost: #{total_break_cost_per_date}")
      end
      
      @component.componentmonths.find(v.id).update_attribute(:total_service_parts, total_service_parts_per_date )
      @component.componentmonths.find(v.id).update_attribute(:total_service_cost, total_service_cost_per_date )
      @component.componentmonths.find(v.id).update_attribute(:total_service_labour, total_service_labour_per_date )
      
      @component.componentmonths.find(v.id).update_attribute(:total_break_parts, total_break_parts_per_date )
      @component.componentmonths.find(v.id).update_attribute(:total_break_cost, total_break_cost_per_date )
      @component.componentmonths.find(v.id).update_attribute(:total_break_labour, total_break_labour_per_date )
      @component.componentmonths.find(v.id).update_attribute(:total_hrs, total_hrs )
    end
    
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
