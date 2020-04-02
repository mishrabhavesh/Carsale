require "application_system_test_case"

class BrandmodelsTest < ApplicationSystemTestCase
  setup do
    @brandmodel = brandmodels(:one)
  end

  test "visiting the index" do
    visit brandmodels_url
    assert_selector "h1", text: "Brandmodels"
  end

  test "creating a Brandmodel" do
    visit brandmodels_url
    click_on "New Brandmodel"

    fill_in "Name", with: @brandmodel.name
    click_on "Create Brandmodel"

    assert_text "Brandmodel was successfully created"
    click_on "Back"
  end

  test "updating a Brandmodel" do
    visit brandmodels_url
    click_on "Edit", match: :first

    fill_in "Name", with: @brandmodel.name
    click_on "Update Brandmodel"

    assert_text "Brandmodel was successfully updated"
    click_on "Back"
  end

  test "destroying a Brandmodel" do
    visit brandmodels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Brandmodel was successfully destroyed"
  end
end
