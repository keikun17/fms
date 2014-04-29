class PreventiveMaintenancesController < ApplicationController
  # GET /preventive_maintenances
  # GET /preventive_maintenances.xml
  def index
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @preventive_maintenances = PreventiveMaintenance.all
    @year = params["year"].nil? ? Time.now.year : params["year"].to_i
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @preventive_maintenances }
    end
  end

  # GET /preventive_maintenances/1
  # GET /preventive_maintenances/1.xml
  def show
    @preventive_maintenance = PreventiveMaintenance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @preventive_maintenance }
    end
  end

  # GET /preventive_maintenances/new
  # GET /preventive_maintenances/new.xml
  def new
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find(params[:vehicle_id])
    @preventive_maintenance = @vehicle.preventive_maintenances.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @preventive_maintenance }
    end
  end

  # GET /preventive_maintenances/1/edit
  def edit
    @preventive_maintenance = PreventiveMaintenance.find(params[:id])
  end

  # POST /preventive_maintenances
  # POST /preventive_maintenances.xml
  def create
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @preventive_maintenance = @vehicle.preventive_maintenances.new(params[:preventive_maintenance])

    respond_to do |format|
      if @preventive_maintenance.save
        format.html { redirect_to(fleet_vehicle_preventive_maintenances_path(@fleet, @vehicle), :notice => 'Vehicle repair was successfully created.') }
        format.xml  { render :xml => @preventive_maintenance, :status => :created, :location => @preventive_maintenance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @preventive_maintenance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /preventive_maintenances/1
  # PUT /preventive_maintenances/1.xml
  def update
    @preventive_maintenance = PreventiveMaintenance.find(params[:id])

    respond_to do |format|
      if @preventive_maintenance.update_attributes(params[:preventive_maintenance])
        format.html { redirect_to(@preventive_maintenance, :notice => 'Preventive maintenance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @preventive_maintenance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /preventive_maintenances/1
  # DELETE /preventive_maintenances/1.xml
  def destroy
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @preventive_maintenance = PreventiveMaintenance.find(params[:id])
    @preventive_maintenance.destroy

    respond_to do |format|
      format.html { redirect_to(fleet_vehicle_preventive_maintenances_path(@fleet, @vehicle)) }
      format.xml  { head :ok }
    end
  end
end
