require 'test_helper'

class ServiceCentersControllerTest < ActionController::TestCase
  setup do
    @service_center = service_centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_center" do
    assert_difference('ServiceCenter.count') do
      post :create, :service_center => @service_center.attributes
    end

    assert_redirected_to service_center_path(assigns(:service_center))
  end

  test "should show service_center" do
    get :show, :id => @service_center.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @service_center.to_param
    assert_response :success
  end

  test "should update service_center" do
    put :update, :id => @service_center.to_param, :service_center => @service_center.attributes
    assert_redirected_to service_center_path(assigns(:service_center))
  end

  test "should destroy service_center" do
    assert_difference('ServiceCenter.count', -1) do
      delete :destroy, :id => @service_center.to_param
    end

    assert_redirected_to service_centers_path
  end
end
