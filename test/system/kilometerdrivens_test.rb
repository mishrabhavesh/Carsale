require "application_system_test_case"

class KilometerdrivensTest < ApplicationSystemTestCase
  setup do
    @kilometerdriven = kilometerdrivens(:one)
  end

  test "visiting the index" do
    visit kilometerdrivens_url
    assert_selector "h1", text: "Kilometerdrivens"
  end

  test "creating a Kilometerdriven" do
    visit kilometerdrivens_url
    click_on "New Kilometerdriven"

    fill_in "Name", with: @kilometerdriven.name
    click_on "Create Kilometerdriven"

    assert_text "Kilometerdriven was successfully created"
    click_on "Back"
  end

  test "updating a Kilometerdriven" do
    visit kilometerdrivens_url
    click_on "Edit", match: :first

    fill_in "Name", with: @kilometerdriven.name
    click_on "Update Kilometerdriven"

    assert_text "Kilometerdriven was successfully updated"
    click_on "Back"
  end

  test "destroying a Kilometerdriven" do
    visit kilometerdrivens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kilometerdriven was successfully destroyed"
  end
end
