t1 = Tip.create!(bookies: "Ladbrokes", odds: 6.0, won: true)
t2 = Tip.create!(bookies: "Betfair", odds: 4.5, won: false)

u1 = User.create!(firstname: "Ari", lastname: "Gold", email: "arigold@email.com", password: "password", role: "Tipster", price: 12.00, win_percentage: 95.00)
u2 = User.create!(firstname: "Vincent", lastname: "Chase", email: "vincentchase@email.com", password: "password", role: "Tipster", price: 5.00, win_percentage: 85.00, tip_id: t2.id)
u3 = User.create!(firstname: "Johnny", lastname: "Drama", email: "johnnydrama@email.com", password: "password", role: "Customer")
u4 = User.create!(firstname: "Eric", lastname: "Murphy", email: "ericmurphy@email.com", password: "password", role: "Customer")

tb1 = TypeOfBet.create!(name: "Home Win")
tb2 = TypeOfBet.create!(name: "Away Win")
tb3 = TypeOfBet.create!(name: "Draw")
tb4 = TypeOfBet.create!(name: "Both teams to score")
tb5 = TypeOfBet.create!(name: "Over 0.5 goals")
tb5 = TypeOfBet.create!(name: "Over 1.5 goals")
tb6 = TypeOfBet.create!(name: "Over 2.5 goals")
tb7 = TypeOfBet.create!(name: "Over 3.5 goals")
tb8 = TypeOfBet.create!(name: "Over 4.5 goals")
tb9 = TypeOfBet.create!(name: "Over 5.5 goals")
tb10 = TypeOfBet.create!(name: "Over 6.5 goals")
tb11 = TypeOfBet.create!(name: "Over 7.5 goals")
tb12 = TypeOfBet.create!(name: "Correct Score")

r1 = Result.create!(betWon: true, goalsAwayTeam: 2, goalsHomeTeam: 1) 
r2 = Result.create!(betWon: true, goalsAwayTeam: 1, goalsHomeTeam: 1) 
r3 = Result.create!(betWon: false, goalsAwayTeam: 2, goalsHomeTeam: 0) 
r4 = Result.create!(betWon: false, goalsAwayTeam: 2, goalsHomeTeam: 2) 
r5 = Result.create!(betWon: true, goalsAwayTeam: 2, goalsHomeTeam: 1) 
r6 = Result.create!(betWon: false, goalsAwayTeam: 2, goalsHomeTeam: 1) 

p1 = Prediction.create!(homeTeam: "Chelsea", awayTeam: "Arsenal", date: DateTime.parse("13/01/2015 15:00"), result_id: r1.id, type_of_bet_id: tb1.id)
p2 = Prediction.create!(homeTeam: "Liverpool", awayTeam: "Everton", date: DateTime.parse("13/01/2015 15:00"), predictionGoalsHomeTeam: 1, predictionGoalsAwayTeam: 1, result_id: r2.id, type_of_bet_id: tb12.id)
p3 = Prediction.create!(homeTeam: "Manchester United", awayTeam: "Manchester City", date: DateTime.parse("13/01/2015 15:00"), predictionGoalsHomeTeam: 1, predictionGoalsAwayTeam: 2, result_id: r3.id, type_of_bet_id: tb4.id)
p4 = Prediction.create!(homeTeam: "West Brom", awayTeam: "Wolves", date: DateTime.parse("13/01/2015 15:00"), result_id: r4.id, type_of_bet_id: tb2.id)
p5 = Prediction.create!(homeTeam: "Burley", awayTeam: "Preston", date: DateTime.parse("13/01/2015 15:00"), result_id: r5.id, type_of_bet_id: tb5.id)
p6 = Prediction.create!(homeTeam: "Newcastle", awayTeam: "Sunderland", date: DateTime.parse("13/01/2015 15:00"), predictionGoalsHomeTeam: 2, predictionGoalsAwayTeam: 2, result_id: r6.id, type_of_bet_id: tb3.id)

t1.predictions = [p1, p2, p5]
t2.predictions = [p3, p4, p6]

u1.tips << [t1]
u2.tips << [t2]
