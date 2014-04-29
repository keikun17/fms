class MileagesController < ApplicationController
  # GET /mileages
  # GET /mileages.xml
  def index
    @mileages = Mileage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mileages }
    end
  end

  # GET /mileages/1
  # GET /mileages/1.xml
  def show
    @mileage = Mileage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mileage }
    end
  end

  # GET /mileages/new
  # GET /mileages/new.xml
  def new
    @mileage = Mileage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mileage }
    end
  end

  # GET /mileages/1/edit
  def edit
    @mileage = Mileage.find(params[:id])
  end

  # POST /mileages
  # POST /mileages.xml
  def create
    @vehicle = Vehicle.find params[:vehicle_id]
    @mileage = @vehicle.mileages.new(params[:mileage])
    
    respond_to do |format|
      if @mileage.save
        format.html { redirect_to([@mileage.vehicle.fleet, @mileage.vehicle], :notice => 'Mileage Record was successfully created.') }
        format.xml  { render :xml => @mileage, :status => :created, :location => @mileage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mileage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mileages/1
  # PUT /mileages/1.xml
  def update
    @mileage = Mileage.find(params[:id])

    respond_to do |format|
      if @mileage.update_attributes(params[:mileage])
        format.html { redirect_to(@mileage, :notice => 'Mileage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mileage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mileages/1
  # DELETE /mileages/1.xml
  def destroy
    @mileage = Mileage.find(params[:id])
    @mileage.destroy

    respond_to do |format|
      format.html { redirect_to([@mileage.vehicle.fleet, @mileage.vehicle], :notice => 'Mileage Record deleted.') }
      format.xml  { head :ok }
    end
  end
end
