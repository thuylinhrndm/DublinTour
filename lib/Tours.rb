class BasicTour
	def initialize(tour_type,tour_date, tour_time)
		@tour_type = tour_type
		@tour_date = tour_date
		@tour_time = tour_time
		@description = "Basic tour"
		@cost = 20
		
	end
	
	# getter method
	def cost
		return @cost
	end
    
	
	def details
		return @description + ": #{@cost}; " + @tour_type.to_s + "; " + @tour_date.to_s + " ;" + @tour_time.to_s
	end	
end

class TourDecorator
	def initialize(basic_tour)
		@basic_tour = basic_tour
		@extraCost = 0
		@description = "no extra feature"
	end
	
	 def cost
        return @extraCost + @realCar.cost
        
    end
	
	def details
		return @description + " " + @basic_tour.details
	end
	
end