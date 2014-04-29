require 'test_helper'

class FuelTypesControllerTest < ActionController::TestCase
  setup do
    @fuel_type = fuel_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fuel_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fuel_type" do
    assert_difference('FuelType.count') do
      post :create, :fuel_type => @fuel_type.attributes
    end

    assert_redirected_to fuel_type_path(assigns(:fuel_type))
  end

  test "should show fuel_type" do
    get :show, :id => @fuel_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fuel_type.to_param
    assert_response :success
  end

  test "should update fuel_type" do
    put :update, :id => @fuel_type.to_param, :fuel_type => @fuel_type.attributes
    assert_redirected_to fuel_type_path(assigns(:fuel_type))
  end

  test "should destroy fuel_type" do
    assert_difference('FuelType.count', -1) do
      delete :destroy, :id => @fuel_type.to_param
    end

    assert_redirected_to fuel_types_path
  end
end
