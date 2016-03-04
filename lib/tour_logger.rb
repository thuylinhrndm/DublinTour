require "singleton"

class TourLogger 
    include Singleton
    
    def initialize
        @log = File.open("tourlog.txt", "a")
    end
    
    
    
    def logInformation(information)
   
        @log.puts(information)
        @log.flush 
    end
    
end