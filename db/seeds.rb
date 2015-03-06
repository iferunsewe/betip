a# t1 = Tip.create!(bookies: "Ladbrokes", odds: 6.0, comment: "Bespoke VHS lomo food truck. Pitchfork gluten-free try-hard craft beer tote bag chambray. Brunch viral cronut kogi. Artisan roof party typewriter, direct trade butcher Pinterest gluten-free tattooed Blue Bottle sustainable.")
# t2 = Tip.create!(bookies: "Bet365", odds: 5.5, comment: "Lomo migas fap chambray, hashtag selvage sustainable fingerstache scenester single-origin coffee roof party. Banksy selvage tote bag, before they sold out Shoreditch mixtape tilde DIY gastropub cliche kale chips Pitchfork pour-over hashtag roof party.")
# t3 = Tip.create!(bookies: "Betfair", odds: 4.5, comment: "Neutra blog actually Kickstarter, Helvetica disrupt sriracha Brooklyn retro selfies chambray tattooed typewriter. Beard sartorial readymade, flannel selfies mustache vinyl.")
# t4 = Tip.create!(bookies: "888.com", odds: 5.0, comment: "Mlkshk Echo Park pop-up street art, next level hoodie jean shorts wayfarers Brooklyn Intelligentsia. Roof party farm-to-table gluten-free, pour-over hashtag banjo Etsy Tumblr.")

u1 = User.create!(name: "Ari Gold", email: "arigold@email.com", password: "password", role: "Tipster", price: 12.00, win_percentage: 95, user_image: File.open(File.join(Rails.root,"/app/assets/images/arigold.jpg")))
u2 = User.create!(name: "Vincent Chase", email: "vincentchase@email.com", password: "password", role: "Tipster", win_percentage: 86, price: 5.00, user_image: File.open(File.join(Rails.root,"/app/assets/images/vinnychase.jpg")))
u3 = User.create!(name: "Johnny Drama", email: "johnnydrama@email.com", password: "password", role: "Customer", user_image:  File.open(File.join(Rails.root,"/app/assets/images/johnnydrama.jpg")))
u4 = User.create!(name: "Eric Murphy", email: "ericmurphy@email.com", password: "password", role: "Customer", user_image: File.open(File.join(Rails.root,"/app/assets/images/ericmurphy.jpg")))
u5 = User.create!(name: "Danny Dyer", email: "dannydyer@email.com", password: "password", role: "Tipster", price: 4.00, win_percentage: 77, user_image: File.open(File.join(Rails.root,"/app/assets/images/dannydyer.jpg")))
u6 = User.create!(name: "Mark Corrigan", email: "markcorrigan@email.com", password: "password", role: "Tipster", price: 9.00, win_percentage: 85, user_image: File.open(File.join(Rails.root, "/app/assets/images/markcorrigan.jpg")))

tb1 = TypeOfBet.create!(name: "Home Win")
tb2 = TypeOfBet.create!(name: "Away Win")
tb3 = TypeOfBet.create!(name: "Draw")
tb4 = TypeOfBet.create!(name: "Both teams to score")
tb5 = TypeOfBet.create!(name: "Over 0.5 goals")
tb6 = TypeOfBet.create!(name: "Over 1.5 goals")
tb7 = TypeOfBet.create!(name: "Over 2.5 goals")
tb8 = TypeOfBet.create!(name: "Over 3.5 goals")
tb9 = TypeOfBet.create!(name: "Over 4.5 goals")
tb10 = TypeOfBet.create!(name: "Over 5.5 goals")
tb11 = TypeOfBet.create!(name: "Over 6.5 goals")
tb12 = TypeOfBet.create!(name: "Over 7.5 goals")
# tb13 = TypeOfBet.create!(name: "Correct Score")

# p1 = Prediction.create!(homeTeam: "Chelsea", awayTeam: "Arsenal", date: DateTime.parse("10/01/2015 15:00"), type_of_bet_id: tb1.id)
# p2 = Prediction.create!(homeTeam: "Liverpool", awayTeam: "Everton", date: DateTime.parse("10/01/2015 15:00"), predictionGoalsHomeTeam: 1, predictionGoalsAwayTeam: 1, type_of_bet_id: tb3.id)
# p3 = Prediction.create!(homeTeam: "Manchester United", awayTeam: "Manchester City", date: DateTime.parse("13/01/2015 15:00"), predictionGoalsHomeTeam: 1, predictionGoalsAwayTeam: 2, type_of_bet_id: tb4.id)
# p4 = Prediction.create!(homeTeam: "West Brom", awayTeam: "Wolves", date: DateTime.parse("16/02/2015 15:00"), type_of_bet_id: tb2.id)
# p5 = Prediction.create!(homeTeam: "Burley", awayTeam: "Preston", date: DateTime.parse("16/02/2015 15:00"), type_of_bet_id: tb5.id)
# p6 = Prediction.create!(homeTeam: "Newcastle", awayTeam: "Sunderland", date: DateTime.parse("08/01/2015 15:00"), predictionGoalsHomeTeam: 2, predictionGoalsAwayTeam: 2, type_of_bet_id: tb3.id)

# r1 = Result.create!(goalsHomeTeam: 2, goalsAwayTeam: 1, prediction_id: p1.id) 
# r2 = Result.create!(goalsHomeTeam: 1, goalsAwayTeam: 1, prediction_id: p2.id) 
# r3 = Result.create!(goalsHomeTeam: 2, goalsAwayTeam: 0, prediction_id: p3.id) 
# r4 = Result.create!(goalsHomeTeam: 2, goalsAwayTeam: 2, prediction_id: p4.id) 
# r5 = Result.create!(goalsHomeTeam: 2, goalsAwayTeam: 1, prediction_id: p5.id) 
# r6 = Result.create!(goalsHomeTeam: 2, goalsAwayTeam: 1, prediction_id: p6.id) 

# t1.predictions = [p1, p2, p5]
# t2.predictions = [p3, p4, p6]
# t3.predictions = [p1, p3, p6]
# t4.predictions = [p2, p5]
 
# t1.save
# t2.save
# t3.save
# t4.save

# u1.tips = [t1, t3]
# u2.tips = [t2, t4]
# u1.save
# u2.save