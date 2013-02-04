class LaboursController < ApplicationController
  before_filter :authenticate_user!
  # GET /labours
  # GET /labours.json
  def index
    @labours = Labour.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @labours }
    end
  end

  # GET /labours/1
  # GET /labours/1.json
  def show
    @labour = Labour.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @labour }
    end
  end

  # GET /labours/new
  # GET /labours/new.json
  def new
    @labour = Labour.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @labour }
    end
  end

  # GET /labours/1/edit
  def edit
    @labour = Labour.find(params[:id])
  end

  # POST /labours
  # POST /labours.json
  def create
    @labour = Labour.new(params[:labour])

    respond_to do |format|
      if @labour.save
        format.html { redirect_to @labour, notice: 'Labour was successfully created.' }
        format.json { render json: @labour, status: :created, location: @labour }
      else
        format.html { render action: "new" }
        format.json { render json: @labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /labours/1
  # PUT /labours/1.json
  def update
    @labour = Labour.find(params[:id])

    respond_to do |format|
      if @labour.update_attributes(params[:labour])
        format.html { redirect_to @labour, notice: 'Labour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labours/1
  # DELETE /labours/1.json
  def destroy
    @labour = Labour.find(params[:id])
    @labour.destroy

    respond_to do |format|
      format.html { redirect_to labours_url }
      format.json { head :no_content }
    end
  end
end
