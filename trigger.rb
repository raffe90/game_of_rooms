class Trigger
	attr_reader :name, :consequence, :game_over
	def initialize(name, consequence, game_over = false)
		@name = name
		@consequence = consequence
		@game_over = game_over
	end


	
	
end