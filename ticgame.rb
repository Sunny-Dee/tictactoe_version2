#tictactoe_version2
#==================
#Tic Tax Toe Version 2

class Game

# Global variables
turn = 0
@board=["0","1","2","3","4","5","6","7","8"]
winning_combinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


# Helper functions
	def new_game
		puts "Basic Tic Tac Toe"
		@board =["0","1","2","3","4","5","6","7","8"]
		winning_combinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		draw_board
	end

	def draw_board
		puts " #{@board[0]}   |  #{@board[1]}     |  #{@board[2]}  "
		puts "_____|________|_____"
		puts " #{@board[3]}   |  #{@board[4]}     |  #{@board[5]}  "
		puts "_____|________|_____"
		puts " #{@board[6]}   |  #{@board[7]}     |  #{@board[8]}  "
		puts "     |        |     "
	end



# Main logic functions 

	def play
		draw_board
		puts "Choose the number of the cell you want to mark"
		choice = gets.to_i
		if turn % 2 != 0
			winning_combinations.gsub!(choice, 'x')
			@board.insert(choice, 'x')
		elsif turn % 2 == 0
			winning_combinations.gsub(choice, 'o')
			@board.insert(choice, 'o')
		end
		draw_board
		check_for_winners
		turn += 1
	end


	def check_for_winners
		winning_combinations.each |combo|
			if combo == ['x', 'x', 'x'] 
				puts 'x wins'
			elsif combo == ['o', 'o', 'o']
				puts 'o wins'
			end	
	end


	def check_for_draws
		if turn > 9 
			puts "Game Over"
			new_game
		else
			play
		end
	end

end
