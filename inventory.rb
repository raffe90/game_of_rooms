class Inventory
	attr_reader :name
	
	def initialize(name)
		@name = name
	end
	
	def add_contents(contents)
		@contents.push(contents)
	end

	def print_message
		puts "You can see a #{@name}"
	end
end