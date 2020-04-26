require 'rails_helper'
require 'spec_helper'

RSpec.describe "SearchTests", type: :request do
  describe "GET /search_tests" do
    it "ensures correct path of search" do
      visit cars_url
      fill_in :search, with: "fiat"
      select "name", :from => "attribute"
      click_button "submit"
      current_path.should eq('/search')

    end
  end
  describe "GET /search_tests" do
    it "gets right car in search" do
      visit cars_url
      fill_in :search, with: "fiat"
      select "name", :from => "attribute"
      click_button "submit"
      expect(page).not_to have_text("BMW")
    end
  end
  describe "GET /search_tests" do
    it "submit without entring details" do
      visit cars_url
      click_button "submit"
      current_path.should eq('/cars')
    end
  end
  describe "GET /search_tests" do
    it "get the correct price" do
      visit cars_url
      fill_in :search, with: "1990"
      select "year", :from => "attribute"
      click_button "submit"
      expect(page).not_to have_text("2009")
    end
  end
  describe "GET /search_tests" do
    it "get the correct year" do
      visit cars_url
      fill_in :search, with: "30"
      select "price", :from => "attribute"
      click_button "submit"
      expect(page).not_to have_text("300")
    end
  end
end