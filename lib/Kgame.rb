require 'httparty'

class Kgame
  attr_accessor :id, :teams
  def initialize()
    get_recent_data
  end

  def get_recent_data
    HTTParty.get('http://www.krossover.com/intelligence/feed/games', :basic_auth => {:username => "SINY", :password => "RSD72aH1uBlIdcX"})
  end
  
  def get_full_data
	HTTParty.get('http://www.krossover.com/intelligence/feed/games', :basic_auth => {:username => "SINY", :password => "RSD72aH1uBlIdcX"})
  end
  
  def get_data_by_team(id)
	HTTParty.get('http://www.krossover.com/intelligence/feed/teams/' + id.to_s + '/games', :basic_auth => {:username => "SINY", :password => "RSD72aH1uBlIdcX"})
  end
  
  def data
    JSON.parse(get_recent_data.body)
  end

  def id
    data.first["id"]
  end

  def teams
    data.first["teams"]
  end
  
  def team_games(id)
	JSON.parse(get_data_by_team(id))
	end
end

game = Kgame.new

puts game.team_games(35615)