require 'rails_helper'

RSpec.describe "ManageStatistics", type: :request do

  describe "GET /total_stat" do
    it "returns http success" do
      get "/manage_statistics/total_stat"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /car_stat" do
    it "returns http success" do
      get "/manage_statistics/car_stat"
      expect(response).to have_http_status(:success)
    end
  end

end
