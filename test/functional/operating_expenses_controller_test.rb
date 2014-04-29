require 'test_helper'

class OperatingExpensesControllerTest < ActionController::TestCase
  setup do
    @operating_expense = operating_expenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operating_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operating_expense" do
    assert_difference('OperatingExpense.count') do
      post :create, :operating_expense => @operating_expense.attributes
    end

    assert_redirected_to operating_expense_path(assigns(:operating_expense))
  end

  test "should show operating_expense" do
    get :show, :id => @operating_expense.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @operating_expense.to_param
    assert_response :success
  end

  test "should update operating_expense" do
    put :update, :id => @operating_expense.to_param, :operating_expense => @operating_expense.attributes
    assert_redirected_to operating_expense_path(assigns(:operating_expense))
  end

  test "should destroy operating_expense" do
    assert_difference('OperatingExpense.count', -1) do
      delete :destroy, :id => @operating_expense.to_param
    end

    assert_redirected_to operating_expenses_path
  end
end
