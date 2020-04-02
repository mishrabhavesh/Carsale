require "application_system_test_case"

class RegistrationyearsTest < ApplicationSystemTestCase
  setup do
    @registrationyear = registrationyears(:one)
  end

  test "visiting the index" do
    visit registrationyears_url
    assert_selector "h1", text: "Registrationyears"
  end

  test "creating a Registrationyear" do
    visit registrationyears_url
    click_on "New Registrationyear"

    fill_in "Name", with: @registrationyear.name
    click_on "Create Registrationyear"

    assert_text "Registrationyear was successfully created"
    click_on "Back"
  end

  test "updating a Registrationyear" do
    visit registrationyears_url
    click_on "Edit", match: :first

    fill_in "Name", with: @registrationyear.name
    click_on "Update Registrationyear"

    assert_text "Registrationyear was successfully updated"
    click_on "Back"
  end

  test "destroying a Registrationyear" do
    visit registrationyears_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Registrationyear was successfully destroyed"
  end
end
