require 'httparty'

class Kgame
  attr_accessor :title, :paragraph
  def initialize()
    get_data
  end

  def get_data
    HTTParty.get('http://www.krossover.com/intelligence/feed/games', :basic_auth => {:username => "SINY", :password => "RSD72aH1uBlIdcX"})
  end

  def data
    JSON.parse(get_data.body)
  end

  def id
     data["id"]["teams"]
  end

  def paragraph
    data["response"]["paragraphs"]
  end
end

game = Kgame.new

puts game.id