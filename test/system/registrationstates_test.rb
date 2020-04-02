require "application_system_test_case"

class RegistrationstatesTest < ApplicationSystemTestCase
  setup do
    @registrationstate = registrationstates(:one)
  end

  test "visiting the index" do
    visit registrationstates_url
    assert_selector "h1", text: "Registrationstates"
  end

  test "creating a Registrationstate" do
    visit registrationstates_url
    click_on "New Registrationstate"

    fill_in "Name", with: @registrationstate.name
    click_on "Create Registrationstate"

    assert_text "Registrationstate was successfully created"
    click_on "Back"
  end

  test "updating a Registrationstate" do
    visit registrationstates_url
    click_on "Edit", match: :first

    fill_in "Name", with: @registrationstate.name
    click_on "Update Registrationstate"

    assert_text "Registrationstate was successfully updated"
    click_on "Back"
  end

  test "destroying a Registrationstate" do
    visit registrationstates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Registrationstate was successfully destroyed"
  end
end
