class Spaces
	def initialize(message, objects = [], triggers = [], inventory = [])
		@message = message
		@objects = objects
		@triggers = triggers
		@directions = []
		@inventory = inventory
		@user_objects = []
	end
	
	def add_direction(direction)
		@directions.push(direction)
	end

	def print_exits
		print "\nExits: " 
		@directions.each{|direction| print direction[:symbol].upcase + " " } 
		print "\n"
	end

	def print_available_inventory
		@inventory.each{|object| object.print_message}
		puts
	end

	def print_message
		print "Your are in a #{@message}. "	
		@objects.each{|object| print "There is a #{object}"}
		print_exits
		print_available_inventory
	end

	def trigger?(word)
		trigger_names = @triggers.map{|trigger| trigger.name}
		trigger_names.include?(word)
	end

	def direction?(word)
		direction_names = @directions.map{|direction| direction[:symbol]}
		direction_names.include?(word)
		# binding.pry
	end

	def inventory?(word)
		object_name_to_verify = word.split(' ')[2]
		if object_name_to_verify.nil? 
			false
		else
			object_names = @inventory.map{|object| object.name}
			object_names.include?(object_name_to_verify.downcase)
		end
	end

	def handle_inventory(object)
		object_name = object.split(' ')[2]
		puts "You pick up a #{object_name}\n "
		@user_objects.push(object_name)
	end

	def new_direction(coordinate)
		@directions.find {|space| space[:symbol] == coordinate.downcase}
	end

	def handle_trigger(position)
		current_trigger = @triggers.find {|trigger| trigger.name == position.downcase}
		puts current_trigger.consequence
	end

	def show_inventory
		print "You have:\n"
		@user_objects.each{|object_name| print "- #{object_name}\n" }
		puts
	end

	def user_objects?(object)
		object_name = object.split(' ')[1]
		if object_name.nil?
			false
		else
			@user_objects.include?(object_name.downcase)
		end
	end

	def handle_user_objects(object)
		object_name = object.split(' ')[1]
		@user_objects.delete(object_name.downcase)
		# puts "Drop #{object_name}\n "
	end
end