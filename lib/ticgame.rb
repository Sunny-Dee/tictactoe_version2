class Game

# Helper functions
	def greet
		puts '     '
		puts 'Would you like to play tic tac toe?'
		puts '     -This game requires two players'
		answer = gets.chomp.downcase
			if answer == 'yes'
				new_game
			else
				puts 'Ok. Bye then.'
				puts '  '
				greet
			end
	end

	def new_game
		puts " "
		puts "Basic Tic Tac Toe"
		@board =["0","1","2","3","4","5","6","7","8"] 
		$winning_combinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		@turn = 1
		draw_board
		play
	end

	def draw_board
		puts " "
		puts " "
		puts " #{@board[0]}   |  #{@board[1]}     |  #{@board[2]}  "
		puts "_____|________|_____"
		puts " #{@board[3]}   |  #{@board[4]}     |  #{@board[5]}  "
		puts "_____|________|_____"
		puts " #{@board[6]}   |  #{@board[7]}     |  #{@board[8]}  "
		puts "     |        |     "
		puts " "
		puts " "
	end



# Main logic functions 

	def play
		while @turn <= 9
			puts "Choose the number of the cell you want to mark"
			choice = gets.to_i #need to find another method because this never raises an exception. 

			if choice.class == Fixnum
		 		if  @turn % 2 == 0
		 			@board[choice] = 'x'

		 			$winning_combinations.each do |item| 
						item.map! { |e| e == choice ? 'x' :  e  }
					end

		 		elsif @turn % 2 != 0
		 			@board[choice] = 'o'

		 			$winning_combinations.each do |item| 
						item.map! { |e| e == choice ? 'o' :  e  }	
					end
		 		end

	 		elsif choice.class != Fixnum
				puts "That is not a valid number"
			end

	 		print draw_board 
	 		@turn += 1
	 		check_for_winners
	 		check_for_draws
	 	end
  	end	

  	def check_for_winners
 		$winning_combinations.each do |combo|
 			if combo == ['x', 'x', 'x'] 
 				puts 'x wins!!!'
 				greet
 			elsif combo == ['o', 'o', 'o']
 				puts 'o wins!!!'
 				greet
 			end	
 		end
 	end

	def check_for_draws
		if @turn > 9 
			puts "Game Over"
			puts " "
			greet
		elsif @turn <= 9
			play
		end
	end

end

Game.new.greet

