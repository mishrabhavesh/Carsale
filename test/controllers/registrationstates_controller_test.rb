require 'test_helper'

class RegistrationstatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registrationstate = registrationstates(:one)
  end

  test "should get index" do
    get registrationstates_url
    assert_response :success
  end

  test "should get new" do
    get new_registrationstate_url
    assert_response :success
  end

  test "should create registrationstate" do
    assert_difference('Registrationstate.count') do
      post registrationstates_url, params: { registrationstate: { name: @registrationstate.name } }
    end

    assert_redirected_to registrationstate_url(Registrationstate.last)
  end

  test "should show registrationstate" do
    get registrationstate_url(@registrationstate)
    assert_response :success
  end

  test "should get edit" do
    get edit_registrationstate_url(@registrationstate)
    assert_response :success
  end

  test "should update registrationstate" do
    patch registrationstate_url(@registrationstate), params: { registrationstate: { name: @registrationstate.name } }
    assert_redirected_to registrationstate_url(@registrationstate)
  end

  test "should destroy registrationstate" do
    assert_difference('Registrationstate.count', -1) do
      delete registrationstate_url(@registrationstate)
    end

    assert_redirected_to registrationstates_url
  end
end
