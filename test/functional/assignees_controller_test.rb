require 'test_helper'

class AssigneesControllerTest < ActionController::TestCase
  setup do
    @assignee = assignees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assignee" do
    assert_difference('Assignee.count') do
      post :create, :assignee => @assignee.attributes
    end

    assert_redirected_to assignee_path(assigns(:assignee))
  end

  test "should show assignee" do
    get :show, :id => @assignee.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @assignee.to_param
    assert_response :success
  end

  test "should update assignee" do
    put :update, :id => @assignee.to_param, :assignee => @assignee.attributes
    assert_redirected_to assignee_path(assigns(:assignee))
  end

  test "should destroy assignee" do
    assert_difference('Assignee.count', -1) do
      delete :destroy, :id => @assignee.to_param
    end

    assert_redirected_to assignees_path
  end
end
