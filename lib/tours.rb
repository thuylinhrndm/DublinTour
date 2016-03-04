class BasicTour
	def initialize(tourtype, day, time)
		@tourtype = tourtype
		@day = day
		@time = time
		@description = "Basic tour"
		@cost = 20
	
		
	end
	
	# getter method
	def cost
		return @cost
	end
    
	
	def details
		return @description + ": #{@cost}; " + @tourtype + "; " + @day.to_s + " ;" + @time.to_s
	end	
end

class TourDecorator
	def initialize(basic_tour)
		@basic_tour = basic_tour
		@extraCost = 0
		@description = "no extra feature"
	end
	
	 def cost
        return @extraCost + @basic_tour.cost
       
	 end
	
	def details
		return @description + " " + @basic_tour.details
	end
	
end

# a concrete decorator
class AudioGuide < TourDecorator
	def initialize(basic_tour)
		super(basic_tour)
		@description = "Book audio Guide"
		@extraCost = 5
	
	end
	
	def details
		return @description + ": #{@extraCost} + " + @basic_tour.details  
	end	
end


# another concrete decorator
class TicketInterestPlace < TourDecorator
	def initialize(basic_tour)
		super(basic_tour)
		@description = "ticket for places of interest"
		@extraCost = 10
	
	end
	
	def details
		return @description + ": #{@extraCost} + " + @basic_tour.details  
	end	
end