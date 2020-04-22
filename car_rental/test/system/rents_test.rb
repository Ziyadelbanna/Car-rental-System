require "application_system_test_case"

class RentsTest < ApplicationSystemTestCase
  setup do
    @rent = rents(:one)
  end

  test "visiting the index" do
    visit rentedCaredCars_url
    assert_selector "h1", text: "Rents"
  end

  test "creating a RentedCar" do
    visit rentedCaredCars_url
    click_on "New RentedCar"

    click_on "Create RentedCar"

    assert_text "RentedCar was successfully created"
    click_on "Back"
  end

  test "updating a RentedCar" do
    visit rentedCaredCars_url
    click_on "Edit", match: :first

    click_on "Update RentedCar"

    assert_text "RentedCar was successfully updated"
    click_on "Back"
  end

  test "destroying a RentedCar" do
    visit rentedCaredCars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "RentedCar was successfully destroyed"
  end
end
