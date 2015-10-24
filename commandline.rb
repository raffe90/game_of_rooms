class Game

	def initialize
		@game_over = false
	end

	def get_direction
		puts ">"
		gets.chomp
	end

	def verify_direction(direction, current_space)
		if current_space.direction?(direction)
			new_space = current_space.new_direction(direction)
			current_space = new_space[:space]
		elsif current_space.trigger?(direction)
			current_space.handle_trigger(direction)
		else
			puts direction.size > 1 ? "I don't understand" : "There is no exit there"
		end
		current_space
	end

	def play(spaces)
		current_space = spaces.sample
		while !@game_over
			current_space.print_message
			direction = get_direction
			current_space = verify_direction(direction, current_space)
		end
	end
	
end