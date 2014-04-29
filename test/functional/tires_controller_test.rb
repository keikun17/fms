require 'test_helper'

class TiresControllerTest < ActionController::TestCase
  setup do
    @tire = tires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tire" do
    assert_difference('Tire.count') do
      post :create, :tire => @tire.attributes
    end

    assert_redirected_to tire_path(assigns(:tire))
  end

  test "should show tire" do
    get :show, :id => @tire.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tire.to_param
    assert_response :success
  end

  test "should update tire" do
    put :update, :id => @tire.to_param, :tire => @tire.attributes
    assert_redirected_to tire_path(assigns(:tire))
  end

  test "should destroy tire" do
    assert_difference('Tire.count', -1) do
      delete :destroy, :id => @tire.to_param
    end

    assert_redirected_to tires_path
  end
end
