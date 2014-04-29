class RepairTypesController < ApplicationController
  # GET /repair_types
  # GET /repair_types.xml
  def index
    @repair_types = RepairType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @repair_types }
    end
  end

  # GET /repair_types/1
  # GET /repair_types/1.xml
  def show
    @repair_type = RepairType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @repair_type }
    end
  end

  # GET /repair_types/new
  # GET /repair_types/new.xml
  def new
    @repair_type = RepairType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @repair_type }
    end
  end

  # GET /repair_types/1/edit
  def edit
    @repair_type = RepairType.find(params[:id])
  end

  # POST /repair_types
  # POST /repair_types.xml
  def create
    @repair_type = RepairType.new(params[:repair_type])

    respond_to do |format|
      if @repair_type.save
        format.html { redirect_to(@repair_type, :notice => 'Repair type was successfully created.') }
        format.xml  { render :xml => @repair_type, :status => :created, :location => @repair_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @repair_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /repair_types/1
  # PUT /repair_types/1.xml
  def update
    @repair_type = RepairType.find(params[:id])

    respond_to do |format|
      if @repair_type.update_attributes(params[:repair_type])
        format.html { redirect_to(@repair_type, :notice => 'Repair type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @repair_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /repair_types/1
  # DELETE /repair_types/1.xml
  def destroy
    @repair_type = RepairType.find(params[:id])
    @repair_type.destroy

    respond_to do |format|
      format.html { redirect_to(repair_types_url) }
      format.xml  { head :ok }
    end
  end
end
