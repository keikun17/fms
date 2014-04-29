require 'test_helper'

class PreventiveMaintenancesControllerTest < ActionController::TestCase
  setup do
    @preventive_maintenance = preventive_maintenances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:preventive_maintenances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preventive_maintenance" do
    assert_difference('PreventiveMaintenance.count') do
      post :create, :preventive_maintenance => @preventive_maintenance.attributes
    end

    assert_redirected_to preventive_maintenance_path(assigns(:preventive_maintenance))
  end

  test "should show preventive_maintenance" do
    get :show, :id => @preventive_maintenance.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @preventive_maintenance.to_param
    assert_response :success
  end

  test "should update preventive_maintenance" do
    put :update, :id => @preventive_maintenance.to_param, :preventive_maintenance => @preventive_maintenance.attributes
    assert_redirected_to preventive_maintenance_path(assigns(:preventive_maintenance))
  end

  test "should destroy preventive_maintenance" do
    assert_difference('PreventiveMaintenance.count', -1) do
      delete :destroy, :id => @preventive_maintenance.to_param
    end

    assert_redirected_to preventive_maintenances_path
  end
end
