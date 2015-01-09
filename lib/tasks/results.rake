class ResultData

    attr_accessor :data

    URL = "http://www.football-data.org/soccerseasons/354/fixtures"

    def initialize
      response = Net::HTTP.get URI(URL)

      @data  = JSON(response)
      update_results_table 
    end

    def update_results_table
      @data.map do |fixture|
        if fixture["date"].to_date >= Date.today && fixture["goalsHomeTeam"] != -1
        @newFixture = Prediction.where(fixture_id: fixture["id"])
        @newFixture.each do |newFixture|
          newFixture.result.update_attributes(goalsHomeTeam: fixture["goalsHomeTeam"], goalsAwayTeam: fixture["goalsAwayTeam"])
        end
      end
    end
    end
  end
  

desc "Updating the results"
task results: :environment do 
  ResultData.new
end
