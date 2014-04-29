class VehicleRepairDetailsController < ApplicationController
  # GET /vehicle_repair_details
  # GET /vehicle_repair_details.xml
  def index
    @vehicle_repair_details = VehicleRepairDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vehicle_repair_details }
    end
  end

  # GET /vehicle_repair_details/1
  # GET /vehicle_repair_details/1.xml
  def show
    @vehicle_repair_detail = VehicleRepairDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vehicle_repair_detail }
    end
  end

  # GET /vehicle_repair_details/new
  # GET /vehicle_repair_details/new.xml
  def new
    @vehicle_repair_detail = VehicleRepairDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vehicle_repair_detail }
    end
  end

  # GET /vehicle_repair_details/1/edit
  def edit
    @vehicle_repair_detail = VehicleRepairDetail.find(params[:id])
  end

  # POST /vehicle_repair_details
  # POST /vehicle_repair_details.xml
  def create
    @vehicle_repair_detail = VehicleRepairDetail.new(params[:vehicle_repair_detail])

    respond_to do |format|
      if @vehicle_repair_detail.save
        format.html { redirect_to(@vehicle_repair_detail, :notice => 'Vehicle repair detail was successfully created.') }
        format.xml  { render :xml => @vehicle_repair_detail, :status => :created, :location => @vehicle_repair_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vehicle_repair_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vehicle_repair_details/1
  # PUT /vehicle_repair_details/1.xml
  def update
    @vehicle_repair_detail = VehicleRepairDetail.find(params[:id])

    respond_to do |format|
      if @vehicle_repair_detail.update_attributes(params[:vehicle_repair_detail])
        format.html { redirect_to(@vehicle_repair_detail, :notice => 'Vehicle repair detail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vehicle_repair_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_repair_details/1
  # DELETE /vehicle_repair_details/1.xml
  def destroy
    @vehicle_repair_detail = VehicleRepairDetail.find(params[:id])
    @vehicle_repair_detail.destroy

    respond_to do |format|
      format.html { redirect_to(vehicle_repair_details_url) }
      format.xml  { head :ok }
    end
  end
end
