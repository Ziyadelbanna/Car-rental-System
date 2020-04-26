require "application_system_test_case"

class SavedCarsTest < ApplicationSystemTestCase
  setup do
    @saved_car = saved_cars(:one)
  end

  test "destroying a Saved car" do
    visit saved_cars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Saved car was successfully destroyed"
  end
end
