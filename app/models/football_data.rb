class FootballData

  attr_accessor :data

  URL = "http://www.football-data.org/soccerseasons/354/fixtures"

  def initialize
    response = Net::HTTP.get URI(URL)

    
    @data  = JSON(response)
    return @data
  end
end