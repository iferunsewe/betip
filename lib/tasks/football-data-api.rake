desc "Pulling all of the fixtures from the footballdata.org API"
task football_data_fixtures: :environment do 
  class FootballData

    attr_accessor :data

    URL = "http://www.football-data.org/soccerseasons/354/fixtures"

    def initialize
      response = Net::HTTP.get URI(URL)

      @data  = JSON(response)
      return @data
    end

    def insert_into_prediction_table
      @data.map do |fixture|
        if fixture["date"].to_date > Date.today
          @newFixture = Prediction.new
          newPrediction.date = fixture["date"]
          newPrediction.homeTeam = fixture["homeTeam"]
          newPrediction.awayTeam = fixture["awayTeam"]
          newPrediction.save
        end
      end
    end
  end
  FootballData
end
