require "application_system_test_case"

class BrandModelsTest < ApplicationSystemTestCase
  setup do
    @brand_model = brand_models(:one)
  end

  test "visiting the index" do
    visit brand_models_url
    assert_selector "h1", text: "Brand Models"
  end

  test "creating a Brand model" do
    visit brand_models_url
    click_on "New Brand Model"

    fill_in "Name", with: @brand_model.name
    click_on "Create Brand model"

    assert_text "Brand model was successfully created"
    click_on "Back"
  end

  test "updating a Brand model" do
    visit brand_models_url
    click_on "Edit", match: :first

    fill_in "Name", with: @brand_model.name
    click_on "Update Brand model"

    assert_text "Brand model was successfully updated"
    click_on "Back"
  end

  test "destroying a Brand model" do
    visit brand_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Brand model was successfully destroyed"
  end
end
