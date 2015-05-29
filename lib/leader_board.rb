require_relative '../db/setup'

class LeaderBoard < ActiveRecord::Base

  def self.show_leaderboard(win_or_loss)
    puts win_or_loss.upcase + " Records"
    puts "----------------------------"
    LeaderBoard.select('player_name, count(*) as "count"').group('player_name').where("#{win_or_loss} = 1").order('count(*) desc').each do |x|
      print "Name: #{x[:player_name]}, Count: #{x[:count]}\n"
    end
  end

end
