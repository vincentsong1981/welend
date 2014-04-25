require 'spec_helper'

describe Flight do

	before do
		@flight = Flight.new(from: "HKG", to: "SEA", start_time: Time.new(), flying_time: Time.new())
	end
	
	describe " destination was correct, start time and flying time were correct"

	it"should be valid." do
		expect(@flight).to be_valid
	end
end

describe Flight do

	before do
		@flight = Flight.new(from: "EEE", to: "HHH",  start_time: Time.new(), flying_time: Time.new())
	end
	
	describe "Invalid destination was incorrect"

	it"should be invalid." do
		expect(@flight).to be_invalid
	end
end

describe Flight do

	before do
		@flight = Flight.new(from: "EEE", to: "HHH",  start_time: "invalid", flying_time: "invalid")
	end
	
	describe "start time and flying time is invalid"

	it"should be invalid." do
		expect(@flight).to be_invalid
	end
end