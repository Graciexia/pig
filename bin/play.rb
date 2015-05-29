require_relative '../lib/pig'
require_relative '../lib/hog'
require_relative '../db/setup'
require_relative '../lib/leader_board'


def select_from(hash)
  loop do
    hash.each do |key, value|
      puts "#{key}) #{value}"
    end
    print "? > "
    input = gets.chomp
    found = hash.find { |k,v| k.to_s == input || v.to_s == input }
    if found
      return found.last
    else
      puts "Invalid selection: #{input}. Please try again."
    end
  end
end

#Pig and Hog are class constants
game_classes = {
  1 => Pig,
  2 => Hog,
  3 => 'show Winner Leaderboard',
  4 => 'show Loser Leaderboard'
}

game_class = select_from(game_classes)
if game_class == 'show Winner Leaderboard'
  LeaderBoard.show_leaderboard('win')
elsif game_class == 'show Loser Leaderboard'
  LeaderBoard.show_leaderboard('loss')
else
  puts "Playing a game of #{game_class}"
  game = game_class.new
  #       ^ game class is either Pig or Hog. The constant of a class can be assigned to a local variable and be used like any other local variable

  game.get_players

  game.play_round until game.winner
  puts "#{game.winning_player} wins!"
end
