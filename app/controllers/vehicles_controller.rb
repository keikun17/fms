class VehiclesController < ApplicationController
  # GET /vehicles
  # GET /vehicles.xml
  
  before_filter :get_fleet
  
  def index
    @vehicles = @fleet.vehicles.paginate :page => params[:page], :order => 'created_at DESC'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vehicles }
    end
  end

  def search
    @query = params[:plate_number] || ""
    @vehicles = @fleet.vehicles.paginate :page => params[:page], :order => 'created_at DESC', :conditions => ["LOWER(plate_number) like ?", "%#{@query.downcase}%"]
    render 'index'
  end

  # GET /vehicles/1
  # GET /vehicles/1.xml
  def show
    @vehicle = Vehicle.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vehicle }
    end
  end

  # GET /vehicles/new
  # GET /vehicles/new.xml
  def new
    @vehicle = Vehicle.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vehicle }
    end
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
    @vehicle.insurances.build if @vehicle.insurances.empty? 
  end

  # POST /vehicles
  # POST /vehicles.xml
  def create
    @vehicle = @fleet.vehicles.create(params[:vehicle])
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to( [@vehicle.fleet, @vehicle], :notice => 'Vehicle was successfully created.') }
        format.xml  { render :xml => @vehicle, :status => :created, :location => @vehicle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vehicle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vehicles/1
  # PUT /vehicles/1.xml
  def update
    @vehicle = Vehicle.find(params[:id])
    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        format.html { redirect_to([@vehicle.fleet,@vehicle], :notice => 'Vehicle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vehicle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.xml
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to(fleet_vehicles_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def get_fleet
    @fleet = Fleet.find params[:fleet_id]
  end
  
end
