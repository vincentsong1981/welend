class Flight < ActiveRecord::Base

	CITY_OPTION = ["SGP", "SZX", "HKG", "JFK", "BOS", "SEA"]
	#before_save {departuredate <= arrivedate}

	validates_inclusion_of :from, :in => CITY_OPTION, :message => "Airport you input should only be one of SGP, SZX, HKG, JFK, BOS, SEA"
	validates_inclusion_of :to, :in => CITY_OPTION, :message => "Airport you input should only be one of SGP, SZX, HKG, JFK, BOS, SEA"
	
	validates_time :start_time
	validates_time :flying_time
end
