class OperatingExpensesController < ApplicationController
  # GET /operating_expenses
  # GET /operating_expenses.xml
  def index
    @fleet = Fleet.find params[:fleet_id]
    @vehicle = @fleet.vehicles.find params[:vehicle_id]
    @year = params[:year] || Time.now.year
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @operating_expenses }
    end
  end

  # GET /operating_expenses/1
  # GET /operating_expenses/1.xml
  def show
    @operating_expense = OperatingExpense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @operating_expense }
    end
  end

  # GET /operating_expenses/new
  # GET /operating_expenses/new.xml
  def new
    @operating_expense = OperatingExpense.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @operating_expense }
    end
  end

  # GET /operating_expenses/1/edit
  def edit
    @operating_expense = OperatingExpense.find(params[:id])
  end

  # POST /operating_expenses
  # POST /operating_expenses.xml
  def create
    @operating_expense = OperatingExpense.new(params[:operating_expense])

    respond_to do |format|
      if @operating_expense.save
        format.html { redirect_to(@operating_expense, :notice => 'Operating expense was successfully created.') }
        format.xml  { render :xml => @operating_expense, :status => :created, :location => @operating_expense }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @operating_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /operating_expenses/1
  # PUT /operating_expenses/1.xml
  def update
    @operating_expense = OperatingExpense.find(params[:id])

    respond_to do |format|
      if @operating_expense.update_attributes(params[:operating_expense])
        format.html { redirect_to(@operating_expense, :notice => 'Operating expense was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @operating_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /operating_expenses/1
  # DELETE /operating_expenses/1.xml
  def destroy
    @operating_expense = OperatingExpense.find(params[:id])
    @operating_expense.destroy

    respond_to do |format|
      format.html { redirect_to(operating_expenses_url) }
      format.xml  { head :ok }
    end
  end
end
