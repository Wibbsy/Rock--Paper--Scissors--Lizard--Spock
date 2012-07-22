require 'socket'               # Get sockets from stdlib
$users = Hash.new


def get_user	
	
	$client = $server.accept       # Wait for a client to connect
	puts("#{$client} connected at #{Time.now}")
	$client.puts("Welcome! Enter a username: ")
	$username = $client.gets.chomp
	$users[$client] = $username
	puts "#{$username} connected"
	#$client.puts "welcome #{$username}"
end


$server = TCPServer.open(2000)  # Socket to listen on port 2000
sockaddr = $server.addr
puts "Server running on #{sockaddr.join(':')}"

loop {                         # Servers run forever
	playerScore = 0
	aiScore = 0
	again = true
	quitGame = false

	get_user()

	$client.puts "\nWelcome to Rock, Paper, Scissors, Lizard, Spock"
	$client.puts "Place your bets\n\n"

#
until quitGame == true;
	until again == false
		quote = "";
		@aiChoice = "rsplz"[rand(5)].chr
		$client.puts "r - rock\np - paper\ns - scissors\nl - lizard\nz - spock"
		@playerChoice = $client.gets.chomp.downcase

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
				$client.puts "\nYou Win!"
				$client.puts quote
				playerScore = playerScore + 1
			when ['r', 'r',], ['p', 'p'], ['s', 's'], ['l', 'l'], ['z', 'z']
				$client.puts "\nTie Game!"
			else
				$client.puts "\nYou Lost!"
				$client.puts quote
				aiScore = aiScore + 1
		end
		
		$client.puts "\t\t\t\tScore|>\t= #{$username}- #{playerScore}\t Computer- #{aiScore}"
		puts "\t\tScore|>\t= #{$username}- #{playerScore}\t Computer- #{aiScore}"
		if aiScore == 7 then winner = "The Computer"; again = false elsif playerScore == 7 then winner = $username; again = false end
	end

	$client.puts "\n\n#{winner} has won!"; puts "\n\n#{winner} has won!"


	$client.puts "play again? (y/n): "	
	playAgain = $client.gets.chomp.downcase
	if playAgain == 'y'
		quitGame = false
		again = true
		playerScore = 0
		aiScore = 0
		winner = ""
	elsif playAgain == 'n' 
		quitGame = true
		puts "#{$client} disconnected"
		$client.close                 # Disconnect from the client
	end
	
end
}

puts "All clients disconnected"
