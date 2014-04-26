class Game

# Helper functions
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
		puts " #{@board[0]}   |  #{@board[1]}     |  #{@board[2]}  "
		puts "_____|________|_____"
		puts " #{@board[3]}   |  #{@board[4]}     |  #{@board[5]}  "
		puts "_____|________|_____"
		puts " #{@board[6]}   |  #{@board[7]}     |  #{@board[8]}  "
		puts "     |        |     "
	end



# Main logic functions 

	def play
		while @turn <= 9
			puts "Choose the number of the cell you want to mark"
			choice = gets.to_i
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
 				new_game
 			elsif combo == ['o', 'o', 'o']
 				puts 'o wins!!!'
 				new_game
 			end	
 		end
 	end

	def check_for_draws
		if @turn > 9 
			puts "Game Over"
			puts " "
			new_game
		else
			play
		end
	end

end

Game.new.new_game

