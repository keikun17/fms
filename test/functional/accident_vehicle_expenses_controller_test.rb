require 'test_helper'

class AccidentVehicleExpensesControllerTest < ActionController::TestCase
  setup do
    @accident_vehicle_expense = accident_vehicle_expenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accident_vehicle_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accident_vehicle_expense" do
    assert_difference('AccidentVehicleExpense.count') do
      post :create, :accident_vehicle_expense => @accident_vehicle_expense.attributes
    end

    assert_redirected_to accident_vehicle_expense_path(assigns(:accident_vehicle_expense))
  end

  test "should show accident_vehicle_expense" do
    get :show, :id => @accident_vehicle_expense.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @accident_vehicle_expense.to_param
    assert_response :success
  end

  test "should update accident_vehicle_expense" do
    put :update, :id => @accident_vehicle_expense.to_param, :accident_vehicle_expense => @accident_vehicle_expense.attributes
    assert_redirected_to accident_vehicle_expense_path(assigns(:accident_vehicle_expense))
  end

  test "should destroy accident_vehicle_expense" do
    assert_difference('AccidentVehicleExpense.count', -1) do
      delete :destroy, :id => @accident_vehicle_expense.to_param
    end

    assert_redirected_to accident_vehicle_expenses_path
  end
end
