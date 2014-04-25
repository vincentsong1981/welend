require 'spec_helper'

describe "Flight index page static content" do

	before  do
		visit flights_path
	end
	
	it "should include introduce content" do
		visit flights_path
		expect(page).to have_content('www.airlines-list.com')
	end
	
	it "should display 'Start Time' element" do
		visit flights_path
		expect(page).to have_selector('select', 'flight[start_time(4i)]')
	end
	
	it "should display 'Flying Time' element" do
		visit flights_path
		expect(page).to have_selector('select', 'flight[flying_time(4i)]')
	end
	
	it "should display 'From Airport' element" do
		visit flights_path
		expect(page).to have_selector('input', 'flight_from')
	end
	
	it "should display 'To Airport' element" do
		visit flights_path
		expect(page).to have_selector('input', 'flight_to')
	end
	
	it "should display 'Carrier Name' element" do
		visit flights_path
		expect(page).to have_selector('input', 'flight[carrier_name]')
	end
	
	it "should display 'Flight Model' element" do
		visit flights_path
		expect(page).to have_selector('input', 'flight[flight_model]')
	end


	
end

describe "Flight add function" do
	
	before do
		visit flights_path
		select '10', :from => :"flight_start_time_4i"
		select '20', :from => :"flight_start_time_5i"
		select '02', :from => :"flight_flying_time_4i"
		select '00', :from => :"flight_flying_time_5i"
		fill_in "flight[carrier_name]", with: "US"
		fill_in "flight[flight_model]", with: "US-K"
	end
	
		
	it "Should add flight success" do
		fill_in "flight[from]", with: "SEA"
		fill_in "flight[to]", with: "HKG"
		expect { click_button "Add" }.to change(Flight, :count).by(1)
	end
	
	it "Should add flight failed as from destination is not correct" do
		fill_in "flight[from]", with: "HHH"
		fill_in "flight[to]", with: "TTT"
		click_button "Add"
		expect(page).to have_content('From Airport you input should only be one of SGP, SZX, HKG, JFK, BOS, SEA')
		expect(page).to have_content('To Airport you input should only be one of SGP, SZX, HKG, JFK, BOS, SEA')
		
	end
	
end

describe "Flight Update function" do
	
	before do
		visit flights_path
		fill_in "flight[from]", with: "SEA"
		fill_in "flight[to]", with: "HKG"
		select '10', :from => :"flight_start_time_4i"
		select '20', :from => :"flight_start_time_5i"
		select '02', :from => :"flight_flying_time_4i"
		select '00', :from => :"flight_flying_time_5i"
		fill_in "flight[carrier_name]", with: "US"
		fill_in "flight[flight_model]", with: "US-K"
		
	end
	
	it "should not display 'Save' link when there is no flight" do
		expect(page).not_to have_content('Save')
	end
		
		
	it "Should update from and to destination success" do
		click_button "Add"
		
		@from_element = all(:css, "input[id$='flight_from']")
		@from_element[0].set("BOS")
		
		@to_element = all(:css, "input[id$='flight_to']")
		@to_element[0].set("HKG")

		
		expect { click_button "Save" }.to change(Flight, :count).by(0)
		expect(page).to have_field('flight[from]', :with => 'BOS')
		expect(page).to have_field('flight[to]', :with => 'HKG')

	end
	
	it "Should not be able to update from, to as invalid destination" do
		click_button "Add"
		
		@from_element = all(:css, "input[id$='flight_from']")
		@from_element[0].set("AAA")
		
		@to_element = all(:css, "input[id$='flight_to']")
		@to_element[0].set("TTT")

		
		expect { click_button "Save" }.to change(Flight, :count).by(0)
		expect(page).not_to have_field('flight[from]', :with => 'AAA')
		expect(page).not_to have_field('flight[to]', :with => 'TTT')

	end
	
	it "Should update carrier name and flight model success" do
		click_button "Add"
		
				
		@carrier_name_element = all(:css, "input[id$='flight_carrier_name']")
		@carrier_name_element[0].set("carrier")
		
		@flying_model_element = all(:css, "input[id$='flight_flight_model']")
		@flying_model_element[0].set("model")
		
		expect { click_button "Save" }.to change(Flight, :count).by(0)
		
		expect(page).to have_field('flight[carrier_name]', :with => 'carrier')
		expect(page).to have_field('flight[flight_model]', :with => 'model')
	end
	
	it "Should update start time and flying time success" do
		click_button "Add"
		
				
		@start_time_element = all(:css, "input[id$='flight_start_time']")
		@start_time_element[0].set("03:30")
		
		@flying_time_element = all(:css, "input[id$='flight_flying_time']")
		@flying_time_element[0].set("04:40")
		
		expect { click_button "Save" }.to change(Flight, :count).by(0)
		
		expect(page).to have_field('flight[start_time]', :with => '03:30')
		expect(page).to have_field('flight[flying_time]', :with => '04:40')
	end
	
	it "Should not be able to update start time and flying time" do
		click_button "Add"
		
				
		@start_time_element = all(:css, "input[id$='flight_start_time']")
		@start_time_element[0].set("70:30")
		
		@flying_time_element = all(:css, "input[id$='flight_flying_time']")
		@flying_time_element[0].set("70:40")
		
		expect { click_button "Save" }.to change(Flight, :count).by(0)
		
		expect(page).not_to have_field('flight[start_time]', :with => '70:30')
		expect(page).not_to have_field('flight[flying_time]', :with => '70:40')
	end

	
end

describe "Flight Delete function" do
	
	before do
		visit flights_path
		fill_in "flight[from]", with: "SEA"
		fill_in "flight[to]", with: "HKG"
		select '10', :from => :"flight_start_time_4i"
		select '20', :from => :"flight_start_time_5i"
		select '02', :from => :"flight_flying_time_4i"
		select '00', :from => :"flight_flying_time_5i"
		fill_in "flight[carrier_name]", with: "US"
		fill_in "flight[flight_model]", with: "US-K"
		
	end
	
	it "should not display 'Delete' link when there is no flight" do
		visit flights_path
		expect(page).not_to have_link('Delete')
	end
	
	it "should delete one flight" do
		click_button "Add"
		expect(page).to have_link('Delete')
		expect { click_link "Delete" }.to change(Flight, :count).by(-1)
	end
	
	
end