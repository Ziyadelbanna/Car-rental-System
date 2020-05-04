require 'rails_helper'

RSpec.describe "total_rentals/new", type: :view do
  before(:each) do
    assign(:total_rental, TotalRental.new())
  end

  it "renders new total_rental form" do
    render

    assert_select "form[action=?][method=?]", total_rentals_path, "post" do
    end
  end
end
