require "pry"

require_relative "spaces.rb"
require_relative "commandline.rb"
require_relative "trigger.rb"
require_relative "spaces.rb"
	


	space1 = Spaces.new("forest. It is very cold",[],[Trigger.new("yell", "No one can hear you", false)])
	space2 = Spaces.new("dark house. It is very silent", ["ghost"], [Trigger.new("cry", "The ghost scares you. Game over", true), Trigger.new("yell", "You scared the ghost", false)])
	space3 = Spaces.new("beach")
	space4 = Spaces.new("mountain")
	space5 = Spaces.new("town")

	space1.add_direction({direction: "e", space: space2})
	space1.add_direction({direction: "w", space: space3})
	space1.add_direction({direction: "s", space: space4})


	space2.add_direction({direction: "w", space: space1})
	space2.add_direction({direction: "n", space: space5})

	space3.add_direction({direction: "e", space: space1})

	
	space4.add_direction({direction: "n", space: space1})

	space5.add_direction({direction: "s", space: space2})

	Game.new.play([space1, space2, space3, space4, space5])

	
	
	
