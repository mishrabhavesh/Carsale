require 'test_helper'

class RegistrationyearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registrationyear = registrationyears(:one)
  end

  test "should get index" do
    get registrationyears_url
    assert_response :success
  end

  test "should get new" do
    get new_registrationyear_url
    assert_response :success
  end

  test "should create registrationyear" do
    assert_difference('Registrationyear.count') do
      post registrationyears_url, params: { registrationyear: { name: @registrationyear.name } }
    end

    assert_redirected_to registrationyear_url(Registrationyear.last)
  end

  test "should show registrationyear" do
    get registrationyear_url(@registrationyear)
    assert_response :success
  end

  test "should get edit" do
    get edit_registrationyear_url(@registrationyear)
    assert_response :success
  end

  test "should update registrationyear" do
    patch registrationyear_url(@registrationyear), params: { registrationyear: { name: @registrationyear.name } }
    assert_redirected_to registrationyear_url(@registrationyear)
  end

  test "should destroy registrationyear" do
    assert_difference('Registrationyear.count', -1) do
      delete registrationyear_url(@registrationyear)
    end

    assert_redirected_to registrationyears_url
  end
end
