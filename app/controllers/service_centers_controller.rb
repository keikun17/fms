class ServiceCentersController < ApplicationController
  # GET /service_centers
  # GET /service_centers.xml
  def index
    @service_centers = ServiceCenter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_centers }
    end
  end

  # GET /service_centers/1
  # GET /service_centers/1.xml
  def show
    @service_center = ServiceCenter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_center }
    end
  end

  # GET /service_centers/new
  # GET /service_centers/new.xml
  def new
    @service_center = ServiceCenter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_center }
    end
  end

  # GET /service_centers/1/edit
  def edit
    @service_center = ServiceCenter.find(params[:id])
  end

  # POST /service_centers
  # POST /service_centers.xml
  def create
    @service_center = ServiceCenter.new(params[:service_center])

    respond_to do |format|
      if @service_center.save
        format.html { redirect_to(@service_center, :notice => 'Service center was successfully created.') }
        format.xml  { render :xml => @service_center, :status => :created, :location => @service_center }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_center.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_centers/1
  # PUT /service_centers/1.xml
  def update
    @service_center = ServiceCenter.find(params[:id])

    respond_to do |format|
      if @service_center.update_attributes(params[:service_center])
        format.html { redirect_to(@service_center, :notice => 'Service center was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_center.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_centers/1
  # DELETE /service_centers/1.xml
  def destroy
    @service_center = ServiceCenter.find(params[:id])
    @service_center.destroy

    respond_to do |format|
      format.html { redirect_to(service_centers_url) }
      format.xml  { head :ok }
    end
  end
end
