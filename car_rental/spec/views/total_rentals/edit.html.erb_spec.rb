require 'rails_helper'

RSpec.describe "total_rentals/edit", type: :view do
  before(:each) do
    @total_rental = assign(:total_rental, TotalRental.create!())
  end

  it "renders the edit total_rental form" do
    render

    assert_select "form[action=?][method=?]", total_rental_path(@total_rental), "post" do
    end
  end
end
