def display_winner(winner_choice)
  case winner_choice
  when 'p'
    "chose Paper"
  when 'r'
    "chose Rock"
  when 's'
    "chose Scissors" 
  end
end

CHOICES = { 'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}

puts "Play Rock Paper Scissors!"

loop do
  begin
    puts "Choose one: (R/P/S)"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  computer_choice = CHOICES.keys.sample

  puts "You #{display_winner(player_choice)} and Computer #{display_winner(computer_choice)}"

  if player_choice == computer_choice
    puts "It's a tie!"
  elsif (player_choice == 'p' && computer_choice == 'r') || (player_choice == 'r' && computer_choice == 'p')
    puts "Paper covers rock!"
    if player_choice == 'p' && computer_choice == 'r'
      puts "You won!"
    else
      puts "Computer won!"
    end
  elsif (player_choice == 'r' && computer_choice == 's') || (player_choice == 's' && computer_choice == 'r')
    puts "Rock smashes Scissors"
    if player_choice == 'r' && computer_choice == 's'
      puts "You won!"
    else
      puts "Computer won!"
    end
  elsif (player_choice == 's' && computer_choice == 'p') || (player_choice == 'p' && computer_choice == 's')
    puts "Scissors cut Paper!"
    if player_choice == 's' && computer_choice == 'p'
      puts "You won!"
    else
      puts "Computer won!"
    end
  end
  
  puts "Play again? (y/n)"
  break if gets.chomp.downcase != 'y'
end

puts "goodbye"




