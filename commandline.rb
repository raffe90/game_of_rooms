class Game

	def initialize
		@game_over = false
	end

	def get_input
		puts ">"
		gets.chomp
	end

	def verify_command(command, current_space)
		if current_space.direction?(command)
			new_space = current_space.new_direction(command)
			current_space = new_space[:space]
		elsif current_space.trigger?(command)
			current_space.handle_trigger(command)
		elsif current_space.user_objects?(command)
			current_space.handle_user_objects(command)
		elsif current_space.inventory?(command)
			current_space.handle_inventory(command)
		elsif command.downcase == 'inventory'
			current_space.show_inventory 
		else
			puts direction.size > 1 ? "I don't understand" : "There is no exit there"
		end
		current_space
	end

	def play(spaces)
		current_space = spaces.sample
		while !@game_over
			current_space.print_message
			current_command = get_input
			current_space = verify_command(current_command, current_space)
		end
	end
end