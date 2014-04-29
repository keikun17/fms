class RegistrationRenewalsController < ApplicationController
  # GET /registration_renewals
  # GET /registration_renewals.xml
  
  def index
    @registration_renewals = RegistrationRenewal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registration_renewals }
    end
  end

  # GET /registration_renewals/1
  # GET /registration_renewals/1.xml
  def show
    @registration_renewal = RegistrationRenewal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration_renewal }
    end
  end

  # GET /registration_renewals/new
  # GET /registration_renewals/new.xml
  def new
    @registration_renewal = RegistrationRenewal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration_renewal }
    end
  end

  # GET /registration_renewals/1/edit
  def edit
    @registration_renewal = RegistrationRenewal.find(params[:id])
  end

  # POST /registration_renewals
  # POST /registration_renewals.xml
  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    @registration_renewal = @vehicle.registration_renewals.new(params[:registration_renewal])

    respond_to do |format|
      if @registration_renewal.save
        format.html { redirect_to([@registration_renewal.vehicle.fleet, @registration_renewal.vehicle], :notice => 'Registration renewal was successfully created.') }
        format.xml  { render :xml => @registration_renewal, :status => :created, :location => @registration_renewal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registration_renewal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registration_renewals/1
  # PUT /registration_renewals/1.xml
  def update
    @registration_renewal = RegistrationRenewal.find(params[:id])

    respond_to do |format|
      if @registration_renewal.update_attributes(params[:registration_renewal])
        format.html { redirect_to(@registration_renewal, :notice => 'Registration renewal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registration_renewal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /registration_renewals/1
  # DELETE /registration_renewals/1.xml
  def destroy
    @registration_renewal = RegistrationRenewal.find(params[:id])
    @registration_renewal.destroy

    respond_to do |format|
      format.html { redirect_to([@registration_renewal.vehicle.fleet, @registration_renewal.vehicle])}
      format.xml  { head :ok }
    end
  end
end
