playerScore = 0
aiScore = 0
again = true
quitGame = false

puts "Enter Player Name"
playerName = $stdin.gets.chomp

until quitGame == true;
	until again == false
		quote = "";
		puts "\nWelcome to Rock, Paper, Scissors, Lizard, Spock!"
		puts "Place your bets\n\n"
		puts "r - rock\np - paper\ns - scissors\nl - lizard\nz - spock"

		@aiChoice = "rsplz"[rand(5)].chr
		@playerChoice = $stdin.gets.chomp.downcase

		case [@playerChoice, @aiChoice]
			when ['p', 'r'], ['r', 'p']
				quote = "Paper covers Rock"
			when ['s', 'p'], ['p', 's']
				quote = "Scissors cuts Paper"
			when ['r', 's'], ['s', 'r']
				quote = "Rock crushes Scissors"
			when ['r', 'l'], ['l', 'r']
				quote = "Rock smashes Lizard"
			when ['l', 'z'], ['z', 'l']
				quote = "Lizard poisons Spock"
			when ['z', 's'], ['s', 'z']
				quote = "Spock smashes Scissors"
			when ['s', 'l'], ['l', 's']
				quote = "Scissors decapitates Lizard"
			when ['l', 'p'], ['p', 'l']
				quote = "Lizard eats Paper"
			when ['p', 'z'], ['z', 'p']
				quote = "Paper disproves Spock"
			when ['z', 'r'], ['r', 'z']
				quote = "Spock vaporises Rock"	
		end
		
		case [@playerChoice, @aiChoice]
			when ['p', 'r'], ['s', 'p'], ['r', 's'], ['r', 'l'], ['l', 'z'], ['z', 's'], ['s', 'l'], ['l', 'p'], ['p', 'z'], ['z', 'r']
				puts "\nYou Win!"
				puts quote
				playerScore = playerScore + 1
			when ['r', 'r',], ['p', 'p'], ['s', 's'], ['l', 'l'], ['z', 'z']
				puts "\nTie Game!"
			else
				puts "\nYou Lost!"
				puts quote
				aiScore = aiScore + 1
		end
		
		puts "\t\t\t\tScore|>\t= #{playerName}- #{playerScore}\t Computer- #{aiScore}"
		if aiScore == 7 then winner = "The Computer"; again = false elsif playerScore == 7 then winner = playerName; again = false end
	end

	puts "\n\n#{winner} has won!"

puts "play again? (y/n): "	
playAgain = $stdin.gets.chomp.downcase
	if playAgain == 'y'
		quitGame = false
		again = true
		playerScore = 0
		aiScore = 0
		winner = ""
	elsif playAgain == 'n' 
		quitGame = true
	end
end
