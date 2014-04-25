require 'spec_helper'

describe "Create Page" do

	it"should have the right title" do
		
		get flights_path
		expect(response.status).to equal(200)
		
	end



end




