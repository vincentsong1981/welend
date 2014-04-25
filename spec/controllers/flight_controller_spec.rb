require 'spec_helper'

describe FlightsController do

  describe "GET 'flights/index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
  
	it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  
	it "loads all of the flights into @flights" do
		flight1, flight2 = Flight.create(from: "HKG", to: "SEA", start_time: Time.new(), flying_time: Time.new()), Flight.create!(from: "HKG", to: "SEA", start_time: Time.new(), flying_time: Time.new())
		get :index

		expect(assigns(:flights)).to match_array([flight1, flight2])
	end
end
