# Tic-Tac-Toe

game_board = [
	[" ", "A", "B", "C"],
	["1", "-", "-", "-"], 
	["2", "-", "-", "-"], 
	["3", "-", "-", "-"]
]

no_winner = true
turn = 1
num_turns = 0

def show_game_board(game_board)
	puts ""
	game_board.each do |a| 
		a.each { |b| print b + " " }
		print "\n"
	end
end

def player_turn(turn, game_board)
	show_game_board(game_board)
	puts "\nPlayer #{turn}, please enter your turn:"
	move = gets.chomp.to_s.upcase.split('')

	if ((move[0]=="A" || move[0]=="B" || move[0]=="C") &&
	   (move[1]=="1" || move[1]=="2" || move[1]=="3"))

		col = case move[0]
		when "A" then 1
		when "B" then 2
		when "C" then 3
		end
		row = move[1].to_i

		if (game_board[row][col] == "-")
			game_board[row][col] = "X" if turn == 1
			game_board[row][col] = "O" if turn == 2
		else
			puts "\nInvalid move"
			player_turn(turn, game_board)
		end
	else
		puts "\nInvalid move"
		player_turn(turn, game_board)
	end
end


while no_winner

	if turn == 1
		player_turn(turn, game_board)
		turn = 2
	elsif turn == 2
		player_turn(turn, game_board)
		turn = 1
	end

	num_turns += 1

	if num_turns >= 9
		puts "\n\n\n**FINAL**"
		show_game_board(game_board)
		puts "\n*********"
		puts "Game over, who won?"
		puts "*********"

		no_winner = false
	end
end