require 'rails_helper'

RSpec.describe "total_rentals/show", type: :view do
  before(:each) do
    @total_rental = assign(:total_rental, TotalRental.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
