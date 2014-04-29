require 'test_helper'

class AccidentAssigneeExpensesControllerTest < ActionController::TestCase
  setup do
    @accident_assignee_expense = accident_assignee_expenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accident_assignee_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accident_assignee_expense" do
    assert_difference('AccidentAssigneeExpense.count') do
      post :create, :accident_assignee_expense => @accident_assignee_expense.attributes
    end

    assert_redirected_to accident_assignee_expense_path(assigns(:accident_assignee_expense))
  end

  test "should show accident_assignee_expense" do
    get :show, :id => @accident_assignee_expense.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @accident_assignee_expense.to_param
    assert_response :success
  end

  test "should update accident_assignee_expense" do
    put :update, :id => @accident_assignee_expense.to_param, :accident_assignee_expense => @accident_assignee_expense.attributes
    assert_redirected_to accident_assignee_expense_path(assigns(:accident_assignee_expense))
  end

  test "should destroy accident_assignee_expense" do
    assert_difference('AccidentAssigneeExpense.count', -1) do
      delete :destroy, :id => @accident_assignee_expense.to_param
    end

    assert_redirected_to accident_assignee_expenses_path
  end
end
