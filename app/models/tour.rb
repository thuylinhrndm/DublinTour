class Tour < ActiveRecord::Base
	belongs_to :user

	# before_create :check_times_do_not_clash

	TYPES = ["Historical", "City Centre", "Coast"]
	DURATIONS = ["2 hours", "4 hours", "All day"]

	# private
	
	# def check_times_do_not_clash
	# end
end
