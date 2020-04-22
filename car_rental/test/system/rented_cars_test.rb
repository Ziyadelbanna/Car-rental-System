require "application_system_test_case"

class RentedCarsTest < ApplicationSystemTestCase
  setup do
    @rented_car = rented_cars(:one)
  end

  test "visiting the index" do
    visit rented_cars_url
    assert_selector "h1", text: "Rented Cars"
  end

  test "creating a Rented car" do
    visit rented_cars_url
    click_on "New Rented Car"

    click_on "Create Rented car"

    assert_text "Rented car was successfully created"
    click_on "Back"
  end

  test "updating a Rented car" do
    visit rented_cars_url
    click_on "Edit", match: :first

    click_on "Update Rented car"

    assert_text "Rented car was successfully updated"
    click_on "Back"
  end

  test "destroying a Rented car" do
    visit rented_cars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rented car was successfully destroyed"
  end
end
