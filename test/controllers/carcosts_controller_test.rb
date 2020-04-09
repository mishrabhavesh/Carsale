require 'test_helper'

class CarcostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carcost = carcosts(:one)
  end

  test "should get index" do
    get carcosts_url
    assert_response :success
  end

  test "should get new" do
    get new_carcost_url
    assert_response :success
  end

  test "should create carcost" do
    assert_difference('Carcost.count') do
      post carcosts_url, params: { carcost: { condition: @carcost.condition, price: @carcost.price } }
    end

    assert_redirected_to carcost_url(Carcost.last)
  end

  test "should show carcost" do
    get carcost_url(@carcost)
    assert_response :success
  end

  test "should get edit" do
    get edit_carcost_url(@carcost)
    assert_response :success
  end

  test "should update carcost" do
    patch carcost_url(@carcost), params: { carcost: { condition: @carcost.condition, price: @carcost.price } }
    assert_redirected_to carcost_url(@carcost)
  end

  test "should destroy carcost" do
    assert_difference('Carcost.count', -1) do
      delete carcost_url(@carcost)
    end

    assert_redirected_to carcosts_url
  end
end
