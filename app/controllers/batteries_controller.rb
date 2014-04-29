class BatteriesController < ApplicationController
  # GET /batteries
  # GET /batteries.xml
  def index
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @batteries = @vehicle.batteries.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @batteries }
    end
  end

  # GET /batteries/1
  # GET /batteries/1.xml
  def show
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @battery = @vehicle.batteries.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @battery }
    end
  end

  # GET /batteries/new
  # GET /batteries/new.xml
  def new
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @battery = @vehicle.batteries.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @battery }
    end
  end

  # GET /batteries/1/edit
  def edit
    @battery = Battery.find(params[:id])
  end

  # POST /batteries
  # POST /batteries.xml
  def create
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @battery = @vehicle.batteries.new (params[:battery])

    respond_to do |format|
      if @battery.save
        format.html { redirect_to(fleet_vehicle_batteries_path(@fleet, @vehicle), :notice => 'Battery record was successfully created.') }
        format.xml  { render :xml => @battery, :status => :created, :location => @battery }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @battery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /batteries/1
  # PUT /batteries/1.xml
  def update
    @battery = Battery.find(params[:id])

    respond_to do |format|
      if @battery.update_attributes(params[:battery])
        format.html { redirect_to(@battery, :notice => 'Battery was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @battery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /batteries/1
  # DELETE /batteries/1.xml
  def destroy
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @battery = @vehicle.batteries.find(params[:id])
    @battery.destroy
    respond_to do |format|
      format.html { redirect_to(fleet_vehicle_batteries_path(@fleet, @vehicle), :notice => 'Battery record was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end
