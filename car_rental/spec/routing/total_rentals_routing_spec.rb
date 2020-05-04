require "rails_helper"

RSpec.describe TotalRentalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/total_rentals").to route_to("total_rentals#index")
    end

    it "routes to #new" do
      expect(get: "/total_rentals/new").to route_to("total_rentals#new")
    end

    it "routes to #show" do
      expect(get: "/total_rentals/1").to route_to("total_rentals#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/total_rentals/1/edit").to route_to("total_rentals#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/total_rentals").to route_to("total_rentals#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/total_rentals/1").to route_to("total_rentals#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/total_rentals/1").to route_to("total_rentals#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/total_rentals/1").to route_to("total_rentals#destroy", id: "1")
    end
  end
end
