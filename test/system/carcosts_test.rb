require "application_system_test_case"

class CarcostsTest < ApplicationSystemTestCase
  setup do
    @carcost = carcosts(:one)
  end

  test "visiting the index" do
    visit carcosts_url
    assert_selector "h1", text: "Carcosts"
  end

  test "creating a Carcost" do
    visit carcosts_url
    click_on "New Carcost"

    fill_in "Condition", with: @carcost.condition
    fill_in "Price", with: @carcost.price
    click_on "Create Carcost"

    assert_text "Carcost was successfully created"
    click_on "Back"
  end

  test "updating a Carcost" do
    visit carcosts_url
    click_on "Edit", match: :first

    fill_in "Condition", with: @carcost.condition
    fill_in "Price", with: @carcost.price
    click_on "Update Carcost"

    assert_text "Carcost was successfully updated"
    click_on "Back"
  end

  test "destroying a Carcost" do
    visit carcosts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carcost was successfully destroyed"
  end
end
