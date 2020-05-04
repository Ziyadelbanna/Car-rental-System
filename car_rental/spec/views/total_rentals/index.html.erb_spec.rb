require 'rails_helper'

RSpec.describe "total_rentals/index", type: :view do
  before(:each) do
    assign(:total_rentals, [
      TotalRental.create!(),
      TotalRental.create!()
    ])
  end

  it "renders a list of total_rentals" do
    render
  end
end
