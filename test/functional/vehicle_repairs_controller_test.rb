require 'test_helper'

class VehicleRepairsControllerTest < ActionController::TestCase
  setup do
    @vehicle_repair = vehicle_repairs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicle_repairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle_repair" do
    assert_difference('VehicleRepair.count') do
      post :create, :vehicle_repair => @vehicle_repair.attributes
    end

    assert_redirected_to vehicle_repair_path(assigns(:vehicle_repair))
  end

  test "should show vehicle_repair" do
    get :show, :id => @vehicle_repair.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vehicle_repair.to_param
    assert_response :success
  end

  test "should update vehicle_repair" do
    put :update, :id => @vehicle_repair.to_param, :vehicle_repair => @vehicle_repair.attributes
    assert_redirected_to vehicle_repair_path(assigns(:vehicle_repair))
  end

  test "should destroy vehicle_repair" do
    assert_difference('VehicleRepair.count', -1) do
      delete :destroy, :id => @vehicle_repair.to_param
    end

    assert_redirected_to vehicle_repairs_path
  end
end
