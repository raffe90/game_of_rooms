class Spaces
	def initialize(message, objects = null, triggers=null)
		@message = message
		@objects = objects
		@triggers = triggers
	end
	
	def add_direction(direction )
		@directions.push(direction)
	end

	def print_message
		puts "Your are in a #{@message}"
			
	end
	
end