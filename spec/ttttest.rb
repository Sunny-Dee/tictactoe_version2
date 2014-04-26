class Test 

$array = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

	def testing
		puts "Enter number"
		choice = gets.to_i
		#array = ['0','1','2'],['3','4','5'],['6','7','8'],['0','3','6'],['1','4','7'],['2','5','8'],['0','4','8'],['2','4','6']]
		$array.each do |item| 
		item.map! { |e| e == choice ? 'x' :  e  }
			print item
		end
		#print array
	end

end

Test.new.testing



	# def play
	# 	while @turn <= 9
	# 		puts "Choose the number of the cell you want to mark"
	# 		choice = gets.to_i
	#  		if  @turn % 2 == 0
	#  			@board[choice] = 'x'
	#  			#for @winning_combinations.each_slice do choice = 'x'

	#  		elsif @turn % 2 != 0
	#  			@board[choice] = 'o'
	#  		end
	#  		print draw_board 
	#  		@turn += 1
	#  		check_for_draws
	#  	end