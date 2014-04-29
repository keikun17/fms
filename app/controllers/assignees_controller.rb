class AssigneesController < ApplicationController
  # GET /assignees
  # GET /assignees.xml
  def index
    @assignees = Assignee.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assignees }
    end
  end

  # GET /assignees/1
  # GET /assignees/1.xml
  def show
    @assignee = Assignee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assignee }
    end
  end

  # GET /assignees/new
  # GET /assignees/new.xml
  def new
    @fleet = Fleet.find(params[:fleet_id])
    @vehicle = @fleet.vehicles.find(params[:vehicle_id])
    @assignee = @vehicle.assignees.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assignee }
    end
  end

  # GET /assignees/1/edit
  def edit
    @fleet = Fleet.find(params[:fleet_id])
    @vehicle = @fleet.vehicles.find(params[:vehicle_id])
    @assignee = @vehicle.assignee
  end

  # POST /assignees
  # POST /assignees.xml
  def create
    @fleet = Fleet.find(params[:fleet_id])
    @vehicle = @fleet.vehicles.find(params[:vehicle_id])
    @assignee = @vehicle.assignees.new(params[:assignee])

    respond_to do |format|
      if @assignee.save
        format.html { redirect_to(fleet_vehicle_path(@fleet, @vehicle), :notice => 'Assignee was successfully created.') }
        format.xml  { render :xml => @assignee, :status => :created, :location => @assignee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assignee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assignees/1
  # PUT /assignees/1.xml
  def update
    @fleet = Fleet.find(params[:fleet_id])
    @vehicle = @fleet.vehicles.find(params[:vehicle_id])
    @assignee = @vehicle.assignee

    respond_to do |format|
      if @assignee.update_attributes(params[:assignee])
        format.html { redirect_to(fleet_vehicle_path(@fleet, @vehicle), :notice => 'Assignee was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assignee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assignees/1
  # DELETE /assignees/1.xml
  def destroy
    @assignee = Assignee.find(params[:id])
    @assignee.destroy

    respond_to do |format|
      format.html { redirect_to(assignees_url) }
      format.xml  { head :ok }
    end
  end
end
