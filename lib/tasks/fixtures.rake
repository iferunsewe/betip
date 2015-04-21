class FootballData

  attr_accessor :data

  URL = "http://www.football-data.org/alpha/soccerseasons/354/fixtures"

  def initialize
    response = Net::HTTP.get URI(URL)

    @data  = JSON(response)
    insert_into_prediction_table  
  end

  def insert_into_prediction_table
    @data["fixtures"].map do |fixture|
      if fixture["date"].to_date > Date.today
        @newFixture = Prediction.create({
          fixture_id: fixture["id"],
          date: fixture["date"],
          homeTeam: fixture["homeTeamName"],
          awayTeam: fixture["awayTeamName"]
          })
        @newFixture.build_result
        @newFixture.save
      end
    end
  end
end


desc "Pulling all of the fixtures from the footballdata.org API"
task fixtures: :environment do 
  if Time.now.monday? 
    FootballData.new
  end
end
