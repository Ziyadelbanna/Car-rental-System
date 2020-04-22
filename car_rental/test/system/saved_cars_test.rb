require "application_system_test_case"

class SavedCarsTest < ApplicationSystemTestCase
  setup do
    @saved_car = saved_cars(:one)
  end

  test "visiting the index" do
    visit saved_cars_url
    assert_selector "h1", text: "Saved Cars"
  end

  test "creating a Saved car" do
    visit saved_cars_url
    click_on "New Saved Car"

    click_on "Create Saved car"

    assert_text "Saved car was successfully created"
    click_on "Back"
  end

  test "updating a Saved car" do
    visit saved_cars_url
    click_on "Edit", match: :first

    click_on "Update Saved car"

    assert_text "Saved car was successfully updated"
    click_on "Back"
  end

  test "destroying a Saved car" do
    visit saved_cars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Saved car was successfully destroyed"
  end
end
