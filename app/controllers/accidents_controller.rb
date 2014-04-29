class AccidentsController < ApplicationController
  # GET /accidents
  # GET /accidents.xml
  def index
    @fleet = Fleet.find(params[:fleet_id])
    @vehicle = @fleet.vehicles.find(params[:vehicle_id])
    @accidents = @vehicle.accidents.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accidents }
    end
  end

  # GET /accidents/1
  # GET /accidents/1.xml
  def show
    @fleet = Fleet.find(params[:fleet_id])
    @vehicle = @fleet.vehicles.find(params[:vehicle_id])
    @accident = @vehicle.accidents.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accident }
    end
  end

  # GET /accidents/new
  # GET /accidents/new.xml
  def new
    @fleet = Fleet.find(params[:fleet_id])
    @vehicle = @fleet.vehicles.find(params[:vehicle_id])
    @accident = Accident.new
    @accident.accident_vehicle_expenses.build
    @accident.accident_assignee_expenses.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accident }
    end
  end

  # GET /accidents/1/edit
  def edit
    @accident = Accident.find(params[:id])
  end

  # POST /accidents
  # POST /accidents.xml
  def create
    @fleet = Fleet.find(params[:fleet_id])
    @vehicle = @fleet.vehicles.find(params[:vehicle_id])
    @accident = @vehicle.accidents.new(params[:accident])

    respond_to do |format|
      if @accident.save
        format.html { redirect_to(fleet_vehicle_accidents_path(@fleet, @vehicle), :notice => 'Accident Record was successfully created.') }
        format.xml  { render :xml => @accident, :status => :created, :location => @accident }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @accident.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accidents/1
  # PUT /accidents/1.xml
  def update
    @accident = Accident.find(params[:id])

    respond_to do |format|
      if @accident.update_attributes(params[:accident])
        format.html { redirect_to(@accident, :notice => 'Accident was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @accident.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accidents/1
  # DELETE /accidents/1.xml
  def destroy
    @fleet = Fleet.find(params[:fleet_id])
    @vehicle = @fleet.vehicles.find(params[:vehicle_id])
    @accident = @vehicle.accidents.find(params[:id])
    @accident.destroy

    respond_to do |format|
      format.html {         format.html { redirect_to(fleet_vehicle_accidents_path(@fleet, @vehicle), :notice => 'Accident was successfully created.') } }
      format.xml  { head :ok }
    end
  end
end
