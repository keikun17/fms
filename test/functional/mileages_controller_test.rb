require 'test_helper'

class MileagesControllerTest < ActionController::TestCase
  setup do
    @mileage = mileages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mileages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mileage" do
    assert_difference('Mileage.count') do
      post :create, :mileage => @mileage.attributes
    end

    assert_redirected_to mileage_path(assigns(:mileage))
  end

  test "should show mileage" do
    get :show, :id => @mileage.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mileage.to_param
    assert_response :success
  end

  test "should update mileage" do
    put :update, :id => @mileage.to_param, :mileage => @mileage.attributes
    assert_redirected_to mileage_path(assigns(:mileage))
  end

  test "should destroy mileage" do
    assert_difference('Mileage.count', -1) do
      delete :destroy, :id => @mileage.to_param
    end

    assert_redirected_to mileages_path
  end
end
