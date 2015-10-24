class Spaces
	def initialize(message, objects = [], triggers = [])
		@message = message
		@objects = objects
		@triggers = triggers
		@directions = []
	end
	
	def add_direction(direction)
		@directions.push(direction)
	end

	def print_message
		print "Your are in a #{@message}. "	
		@objects.each{|object| print "There is a #{object}"}
		puts
	end

	def trigger?(word)
		trigger_names = @triggers.map{|trigger| trigger.name}
		trigger_names.include?(word)
	end

	def direction?(word)
		direction_names = @directions.map{|direction| direction[:direction]}
		direction_names.include?(word)
		# binding.pry
	end

	def new_direction(coordinate)
		@directions.find {|space| space[:direction] == coordinate.downcase}
	end

	def handle_trigger(position)
		current_trigger = @triggers.find {|trigger| trigger.name == position.downcase}
		puts current_trigger.consequence
	end
	# def handle_move(position)
	# 	binding.pry
	# 	if position.size > 1
	# 		@triggers.find {|trigger| trigger == position.downcase}
	# 	else	
	# 		@directions.find {|space| space[:direction] == position.downcase}
	# 	end

	# end
	
end