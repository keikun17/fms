class AccidentVehicleExpensesController < ApplicationController
  # GET /accident_vehicle_expenses
  # GET /accident_vehicle_expenses.xml
  def index
    @accident_vehicle_expenses = AccidentVehicleExpense.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accident_vehicle_expenses }
    end
  end

  # GET /accident_vehicle_expenses/1
  # GET /accident_vehicle_expenses/1.xml
  def show
    @accident_vehicle_expense = AccidentVehicleExpense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accident_vehicle_expense }
    end
  end

  # GET /accident_vehicle_expenses/new
  # GET /accident_vehicle_expenses/new.xml
  def new
    @accident_vehicle_expense = AccidentVehicleExpense.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accident_vehicle_expense }
    end
  end

  # GET /accident_vehicle_expenses/1/edit
  def edit
    @accident_vehicle_expense = AccidentVehicleExpense.find(params[:id])
  end

  # POST /accident_vehicle_expenses
  # POST /accident_vehicle_expenses.xml
  def create
    @accident_vehicle_expense = AccidentVehicleExpense.new(params[:accident_vehicle_expense])

    respond_to do |format|
      if @accident_vehicle_expense.save
        format.html { redirect_to(@accident_vehicle_expense, :notice => 'Accident vehicle expense was successfully created.') }
        format.xml  { render :xml => @accident_vehicle_expense, :status => :created, :location => @accident_vehicle_expense }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @accident_vehicle_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accident_vehicle_expenses/1
  # PUT /accident_vehicle_expenses/1.xml
  def update
    @accident_vehicle_expense = AccidentVehicleExpense.find(params[:id])

    respond_to do |format|
      if @accident_vehicle_expense.update_attributes(params[:accident_vehicle_expense])
        format.html { redirect_to(@accident_vehicle_expense, :notice => 'Accident vehicle expense was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @accident_vehicle_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accident_vehicle_expenses/1
  # DELETE /accident_vehicle_expenses/1.xml
  def destroy
    @accident_vehicle_expense = AccidentVehicleExpense.find(params[:id])
    @accident_vehicle_expense.destroy

    respond_to do |format|
      format.html { redirect_to(accident_vehicle_expenses_url) }
      format.xml  { head :ok }
    end
  end
end
