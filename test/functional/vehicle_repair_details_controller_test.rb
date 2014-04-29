require 'test_helper'

class VehicleRepairDetailsControllerTest < ActionController::TestCase
  setup do
    @vehicle_repair_detail = vehicle_repair_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicle_repair_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle_repair_detail" do
    assert_difference('VehicleRepairDetail.count') do
      post :create, :vehicle_repair_detail => @vehicle_repair_detail.attributes
    end

    assert_redirected_to vehicle_repair_detail_path(assigns(:vehicle_repair_detail))
  end

  test "should show vehicle_repair_detail" do
    get :show, :id => @vehicle_repair_detail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vehicle_repair_detail.to_param
    assert_response :success
  end

  test "should update vehicle_repair_detail" do
    put :update, :id => @vehicle_repair_detail.to_param, :vehicle_repair_detail => @vehicle_repair_detail.attributes
    assert_redirected_to vehicle_repair_detail_path(assigns(:vehicle_repair_detail))
  end

  test "should destroy vehicle_repair_detail" do
    assert_difference('VehicleRepairDetail.count', -1) do
      delete :destroy, :id => @vehicle_repair_detail.to_param
    end

    assert_redirected_to vehicle_repair_details_path
  end
end
