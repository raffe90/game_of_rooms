require_relative "spaces.rb"
	
	space1 = Space.new("forest" )
	space2 = Space.new("dark house", ["ghost"], ["cry"])
	space3 = Space.new("beach")
	space4 = Space.new("mountain")
	space5 = Space.new("town")

	space1.add_direction({direction: "n", space: space4})
	
	
