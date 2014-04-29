require 'test_helper'

class RegistrationRenewalsControllerTest < ActionController::TestCase
  setup do
    @registration_renewal = registration_renewals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_renewals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration_renewal" do
    assert_difference('RegistrationRenewal.count') do
      post :create, :registration_renewal => @registration_renewal.attributes
    end

    assert_redirected_to registration_renewal_path(assigns(:registration_renewal))
  end

  test "should show registration_renewal" do
    get :show, :id => @registration_renewal.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @registration_renewal.to_param
    assert_response :success
  end

  test "should update registration_renewal" do
    put :update, :id => @registration_renewal.to_param, :registration_renewal => @registration_renewal.attributes
    assert_redirected_to registration_renewal_path(assigns(:registration_renewal))
  end

  test "should destroy registration_renewal" do
    assert_difference('RegistrationRenewal.count', -1) do
      delete :destroy, :id => @registration_renewal.to_param
    end

    assert_redirected_to registration_renewals_path
  end
end
