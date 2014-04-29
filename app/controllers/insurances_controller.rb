class InsurancesController < ApplicationController
  def create
    @vehicle = Vehicle.find params[:vehicle_id]
    @insurance = @vehicle.insurances.new(params[:insurance])
    
    respond_to do |format|
      if @insurance.save
        format.html { redirect_to([@insurance.vehicle.fleet, @insurance.vehicle], :notice => 'Insurance Record was successfully created.') }
        format.xml  { render :xml => @insurance, :status => :created, :location => @insurance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @insurance.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @insurance = Insurance.find(params[:id])
    @insurance.destroy

    respond_to do |format|
      format.html { redirect_to([@insurance.vehicle.fleet, @insurance.vehicle], :notice => 'Insurance Record deleted.') }
      format.xml  { head :ok }
    end
  end
end
