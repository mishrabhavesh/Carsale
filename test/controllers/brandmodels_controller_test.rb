require 'test_helper'

class BrandmodelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brandmodel = brandmodels(:one)
  end

  test "should get index" do
    get brandmodels_url
    assert_response :success
  end

  test "should get new" do
    get new_brandmodel_url
    assert_response :success
  end

  test "should create brandmodel" do
    assert_difference('Brandmodel.count') do
      post brandmodels_url, params: { brandmodel: { name: @brandmodel.name } }
    end

    assert_redirected_to brandmodel_url(Brandmodel.last)
  end

  test "should show brandmodel" do
    get brandmodel_url(@brandmodel)
    assert_response :success
  end

  test "should get edit" do
    get edit_brandmodel_url(@brandmodel)
    assert_response :success
  end

  test "should update brandmodel" do
    patch brandmodel_url(@brandmodel), params: { brandmodel: { name: @brandmodel.name } }
    assert_redirected_to brandmodel_url(@brandmodel)
  end

  test "should destroy brandmodel" do
    assert_difference('Brandmodel.count', -1) do
      delete brandmodel_url(@brandmodel)
    end

    assert_redirected_to brandmodels_url
  end
end
