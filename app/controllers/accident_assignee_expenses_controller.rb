class AccidentAssigneeExpensesController < ApplicationController
  # GET /accident_assignee_expenses
  # GET /accident_assignee_expenses.xml
  def index
    @accident_assignee_expenses = AccidentAssigneeExpense.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accident_assignee_expenses }
    end
  end

  # GET /accident_assignee_expenses/1
  # GET /accident_assignee_expenses/1.xml
  def show
    @accident_assignee_expense = AccidentAssigneeExpense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accident_assignee_expense }
    end
  end

  # GET /accident_assignee_expenses/new
  # GET /accident_assignee_expenses/new.xml
  def new
    @accident_assignee_expense = AccidentAssigneeExpense.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accident_assignee_expense }
    end
  end

  # GET /accident_assignee_expenses/1/edit
  def edit
    @accident_assignee_expense = AccidentAssigneeExpense.find(params[:id])
  end

  # POST /accident_assignee_expenses
  # POST /accident_assignee_expenses.xml
  def create
    @accident_assignee_expense = AccidentAssigneeExpense.new(params[:accident_assignee_expense])

    respond_to do |format|
      if @accident_assignee_expense.save
        format.html { redirect_to(@accident_assignee_expense, :notice => 'Accident assignee expense was successfully created.') }
        format.xml  { render :xml => @accident_assignee_expense, :status => :created, :location => @accident_assignee_expense }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @accident_assignee_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accident_assignee_expenses/1
  # PUT /accident_assignee_expenses/1.xml
  def update
    @accident_assignee_expense = AccidentAssigneeExpense.find(params[:id])

    respond_to do |format|
      if @accident_assignee_expense.update_attributes(params[:accident_assignee_expense])
        format.html { redirect_to(@accident_assignee_expense, :notice => 'Accident assignee expense was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @accident_assignee_expense.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accident_assignee_expenses/1
  # DELETE /accident_assignee_expenses/1.xml
  def destroy
    @accident_assignee_expense = AccidentAssigneeExpense.find(params[:id])
    @accident_assignee_expense.destroy

    respond_to do |format|
      format.html { redirect_to(accident_assignee_expenses_url) }
      format.xml  { head :ok }
    end
  end
end
