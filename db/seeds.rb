t1 = Tip.create!(bookies: "Ladbrokes", odds: 6.0, won: true)
t2 = Tip.create!(bookies: "Bet365", odds: 5.5, won: false)
t3 = Tip.create!(bookies: "Betfair", odds: 4.5, won: false)
t4 = Tip.create!(bookies: "888.com", odds: 5.0, won: true)

u1 = User.create!(name: "Ari Gold", email: "arigold@email.com", password: "password", role: "Tipster", price: 12.00, win_percentage: 95.00, user_image: File.open(File.join(Rails.root,"/app/assets/images/arigold.jpg")))
u2 = User.create!(name: "Vincent Chase", email: "vincentchase@email.com", password: "password", role: "Tipster", price: 5.00, win_percentage: 85.00, user_image: File.open(File.join(Rails.root,"/app/assets/images/vinnychase.jpg")))
u3 = User.create!(name: "Johnny Drama", email: "johnnydrama@email.com", password: "password", role: "Customer", win_percentage: 0, user_image:  File.open(File.join(Rails.root,"/app/assets/images/johnnydrama.jpg")))
u4 = User.create!(name: "Eric Murphy", email: "ericmurphy@email.com", password: "password", role: "Customer", win_percentage: 0, user_image: File.open(File.join(Rails.root,"/app/assets/images/ericmurphy.jpg")))
u5 = User.create!(name: "Danny Dyer", email: "dannydyer@email.com", password: "password", role: "Tipster", price: 4.00, win_percentage: 73.00, user_image: File.open(File.join(Rails.root,"/app/assets/images/dannydyer.jpg")))
u6 = User.create!(name: "Mark Corrigan", email: "markcorrigan@email.com", password: "password", role: "Tipster", price: 9.00, win_percentage: 87.00, user_image: File.open(File.join(Rails.root, "/app/assets/images/markcorrigan.jpg")))

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

p1 = Prediction.create!(homeTeam: "Chelsea", awayTeam: "Arsenal", date: DateTime.parse("16/12/2014 15:00"), type_of_bet_id: tb1.id)
p2 = Prediction.create!(homeTeam: "Liverpool", awayTeam: "Everton", date: DateTime.parse("16/12/2014 15:00"), predictionGoalsHomeTeam: 1, predictionGoalsAwayTeam: 1, type_of_bet_id: tb12.id)
p3 = Prediction.create!(homeTeam: "Manchester United", awayTeam: "Manchester City", date: DateTime.parse("13/01/2015 15:00"), predictionGoalsHomeTeam: 1, predictionGoalsAwayTeam: 2, type_of_bet_id: tb4.id)
p4 = Prediction.create!(homeTeam: "West Brom", awayTeam: "Wolves", date: DateTime.parse("24/12/2014 15:00"), type_of_bet_id: tb2.id)
p5 = Prediction.create!(homeTeam: "Burley", awayTeam: "Preston", date: DateTime.parse("24/12/2014 15:00"), type_of_bet_id: tb5.id)
p6 = Prediction.create!(homeTeam: "Newcastle", awayTeam: "Sunderland", date: DateTime.parse("09/12/2014 15:00"), predictionGoalsHomeTeam: 2, predictionGoalsAwayTeam: 2, type_of_bet_id: tb3.id)
p7 = Prediction.create!(homeTeam: "Real Madrid", awayTeam: "Atletico Madrid", date: DateTime.parse("08/12/2014 19:00"))

r1 = Result.create!(betWon: true, goalsAwayTeam: 2, goalsHomeTeam: 1, prediction_id: p1.id) 
r2 = Result.create!(betWon: true, goalsAwayTeam: 1, goalsHomeTeam: 1, prediction_id: p2.id) 
r3 = Result.create!(betWon: false, goalsAwayTeam: 2, goalsHomeTeam: 0, prediction_id: p3.id) 
r4 = Result.create!(betWon: false, goalsAwayTeam: 2, goalsHomeTeam: 2, prediction_id: p4.id) 
r5 = Result.create!(betWon: true, goalsAwayTeam: 2, goalsHomeTeam: 1, prediction_id: p5.id) 
r6 = Result.create!(betWon: false, goalsAwayTeam: 2, goalsHomeTeam: 1, prediction_id: p6.id) 

t1.predictions = [p1, p2, p5]
t2.predictions = [p3, p4, p6]
t3.predictions = [p1, p3, p6]
t4.predictions = [p2, p5]
 
t1.save
t2.save
t3.save
t4.save

u1.tips = [t1, t3]
u2.tips = [t2, t4]
u1.save
u2.save