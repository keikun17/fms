class VehicleRepairsController < ApplicationController
  # GET /vehicle_repairs
  # GET /vehicle_repairs.xml
  def index
    @vehicle_repairs = VehicleRepair.all
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vehicle_repairs }
    end
  end

  # GET /vehicle_repairs/1
  # GET /vehicle_repairs/1.xml
  def show
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @vehicle_repair = @vehicle.vehicle_repairs.find params[:id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vehicle_repair }
    end
  end

  # GET /vehicle_repairs/new
  # GET /vehicle_repairs/new.xml
  def new
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find(params[:vehicle_id])
    @vehicle_repair = @vehicle.vehicle_repairs.new
    @vehicle_repair.vehicle_repair_details.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vehicle_repair }
    end
  end

  # GET /vehicle_repairs/1/edit
  def edit
    @vehicle_repair = VehicleRepair.find(params[:id])
  end

  # POST /vehicle_repairs
  # POST /vehicle_repairs.xml
  def create
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @vehicle_repair = @vehicle.vehicle_repairs.new(params[:vehicle_repair])

    respond_to do |format|
      if @vehicle_repair.save
        format.html { redirect_to(fleet_vehicle_vehicle_repairs_path(@fleet, @vehicle), :notice => 'Vehicle repair was successfully created.') }
        format.xml  { render :xml => @vehicle_repair, :status => :created, :location => @vehicle_repair }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vehicle_repair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vehicle_repairs/1
  # PUT /vehicle_repairs/1.xml
  def update
    @vehicle_repair = VehicleRepair.find(params[:id])

    respond_to do |format|
      if @vehicle_repair.update_attributes(params[:vehicle_repair])
        format.html { redirect_to(@vehicle_repair, :notice => 'Vehicle repair was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vehicle_repair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_repairs/1
  # DELETE /vehicle_repairs/1.xml
  def destroy
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @vehicle_repair = @vehicle.vehicle_repairs.find(params[:id])
    @vehicle_repair.destroy

    respond_to do |format|
      format.html { redirect_to(fleet_vehicle_vehicle_repairs_path(@fleet, @vehicle), :notice => 'Vehicle repair was successfully created.') }
      format.xml  { head :ok }
    end
  end
end
