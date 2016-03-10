class Tour < ActiveRecord::Base
	belongs_to :user

	# before_create :check_times_do_not_clash

	TYPES = ["Historic Old Dublin Walking Tour", "Wicklow Mountains Tour from Dublin Ireland", 
     "Belfast Day Tour from Dublin", "Irish Whiskey Museum Tour in Dublin", 
     "West of Ireland and Cliffs of Moher Tour ", "Kilkenny/Dunmore East/Waterford Tour"]
	 TIMES = ["8:30 AM - 4:30 PM", "9:00 AM - 5:00 PM", "9:30 AM - 5:30 PM"]
	 


end
