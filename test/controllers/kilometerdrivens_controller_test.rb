require 'test_helper'

class KilometerdrivensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kilometerdriven = kilometerdrivens(:one)
  end

  test "should get index" do
    get kilometerdrivens_url
    assert_response :success
  end

  test "should get new" do
    get new_kilometerdriven_url
    assert_response :success
  end

  test "should create kilometerdriven" do
    assert_difference('Kilometerdriven.count') do
      post kilometerdrivens_url, params: { kilometerdriven: { name: @kilometerdriven.name } }
    end

    assert_redirected_to kilometerdriven_url(Kilometerdriven.last)
  end

  test "should show kilometerdriven" do
    get kilometerdriven_url(@kilometerdriven)
    assert_response :success
  end

  test "should get edit" do
    get edit_kilometerdriven_url(@kilometerdriven)
    assert_response :success
  end

  test "should update kilometerdriven" do
    patch kilometerdriven_url(@kilometerdriven), params: { kilometerdriven: { name: @kilometerdriven.name } }
    assert_redirected_to kilometerdriven_url(@kilometerdriven)
  end

  test "should destroy kilometerdriven" do
    assert_difference('Kilometerdriven.count', -1) do
      delete kilometerdriven_url(@kilometerdriven)
    end

    assert_redirected_to kilometerdrivens_url
  end
end
