require 'tour_logger' 

class TourObserver < ActiveRecord::Observer

    def after_update(record)
        
    # use the TourLogger instance method to retrieve the single instance/object
    @logger = TourLogger.instance
    
    # use the logger to log/record a message about the updated tour
    @logger.logInformation("############ Observer Demo:###########") 
    @logger.logInformation("+++ TourObserver: The tour of #{record.firstname} #{record.lastname} has been updated. cost: #{record.cost}, 
    tour type: #{record.tourtype}, date: #{record.day} and time: #{record.time.strftime("%H:%M %p")}")
    @logger.logInformation(" ###################################") 
    
    end 
end