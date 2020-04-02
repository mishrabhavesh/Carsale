require 'test_helper'

class BrandModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brand_model = brand_models(:one)
  end

  test "should get index" do
    get brand_models_url
    assert_response :success
  end

  test "should get new" do
    get new_brand_model_url
    assert_response :success
  end

  test "should create brand_model" do
    assert_difference('BrandModel.count') do
      post brand_models_url, params: { brand_model: { name: @brand_model.name } }
    end

    assert_redirected_to brand_model_url(BrandModel.last)
  end

  test "should show brand_model" do
    get brand_model_url(@brand_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_brand_model_url(@brand_model)
    assert_response :success
  end

  test "should update brand_model" do
    patch brand_model_url(@brand_model), params: { brand_model: { name: @brand_model.name } }
    assert_redirected_to brand_model_url(@brand_model)
  end

  test "should destroy brand_model" do
    assert_difference('BrandModel.count', -1) do
      delete brand_model_url(@brand_model)
    end

    assert_redirected_to brand_models_url
  end
end
