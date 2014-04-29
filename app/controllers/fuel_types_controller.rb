class FuelTypesController < ApplicationController
  # GET /fuel_types
  # GET /fuel_types.xml
  def index
    @fuel_types = FuelType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fuel_types }
    end
  end

  # GET /fuel_types/1
  # GET /fuel_types/1.xml
  def show
    @fuel_type = FuelType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fuel_type }
    end
  end

  # GET /fuel_types/new
  # GET /fuel_types/new.xml
  def new
    @fuel_type = FuelType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fuel_type }
    end
  end

  # GET /fuel_types/1/edit
  def edit
    @fuel_type = FuelType.find(params[:id])
  end

  # POST /fuel_types
  # POST /fuel_types.xml
  def create
    @fuel_type = FuelType.new(params[:fuel_type])

    respond_to do |format|
      if @fuel_type.save
        format.html { redirect_to(@fuel_type, :notice => 'Fuel type was successfully created.') }
        format.xml  { render :xml => @fuel_type, :status => :created, :location => @fuel_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fuel_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fuel_types/1
  # PUT /fuel_types/1.xml
  def update
    @fuel_type = FuelType.find(params[:id])

    respond_to do |format|
      if @fuel_type.update_attributes(params[:fuel_type])
        format.html { redirect_to(@fuel_type, :notice => 'Fuel type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fuel_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fuel_types/1
  # DELETE /fuel_types/1.xml
  def destroy
    @fuel_type = FuelType.find(params[:id])
    @fuel_type.destroy

    respond_to do |format|
      format.html { redirect_to(fuel_types_url) }
      format.xml  { head :ok }
    end
  end
end
