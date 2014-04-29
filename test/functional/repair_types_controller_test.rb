require 'test_helper'

class RepairTypesControllerTest < ActionController::TestCase
  setup do
    @repair_type = repair_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repair_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repair_type" do
    assert_difference('RepairType.count') do
      post :create, :repair_type => @repair_type.attributes
    end

    assert_redirected_to repair_type_path(assigns(:repair_type))
  end

  test "should show repair_type" do
    get :show, :id => @repair_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @repair_type.to_param
    assert_response :success
  end

  test "should update repair_type" do
    put :update, :id => @repair_type.to_param, :repair_type => @repair_type.attributes
    assert_redirected_to repair_type_path(assigns(:repair_type))
  end

  test "should destroy repair_type" do
    assert_difference('RepairType.count', -1) do
      delete :destroy, :id => @repair_type.to_param
    end

    assert_redirected_to repair_types_path
  end
end
