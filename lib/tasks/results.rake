class ResultData

  attr_accessor :data

  URL = "http://www.football-data.org/alpha/soccerseasons/354/fixtures"

  def initialize
    response = Net::HTTP.get URI(URL)

    @data  = JSON(response)
    update_results_table 
  end

  def update_results_table
    @data["fixtures"].map do |fixture|
      if fixture["date"].to_date <= Date.today && fixture["result"]["goalsHomeTeam"] != -1
        @newFixture = Prediction.where(fixture_id: fixture["id"])
        @newFixture.each do |newFixture|
          newFixture.result.update_attributes(goalsHomeTeam: fixture["result"]["goalsHomeTeam"], goalsAwayTeam: fixture["result"]["goalsAwayTeam"])
          newFixture.save
        end 
      end
    end
  end
end
  

desc "Updating the results"
task results: :environment do 
  if Time.now.tuesday?
    ResultData.new
  end
end
