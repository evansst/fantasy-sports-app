FantasyLeague.delete_all
User.delete_all
FantasyTeam.delete_all
SportsTeam.delete_all

bills = SportsTeam.create(name: "Buffalo Bills")
dolphins = SportsTeam.create(name: "Miami Dolphins")
patriots = SportsTeam.create(name: "New England Patriots")
jets = SportsTeam.create(name: "New York Jets")

ravens = SportsTeam.create(name: "Baltimore Ravens")
bengals = SportsTeam.create(name: "Cincinnati Bengals")
browns = SportsTeam.create(name: "Cleveland Browns")
steelers = SportsTeam.create(name: "Pittsburgh Steelers")

texans = SportsTeam.create(name: "Houston Texans")
colts = SportsTeam.create(name: "Indianapolis Colts")
jaguars = SportsTeam.create(name: "Jacksonville Jaguars")
titans = SportsTeam.create(name: "Tennesee Titans")

broncos = SportsTeam.create(name: "Denver Broncos")
chiefs = SportsTeam.create(name: "Kansas City Chiefs")
raiders = SportsTeam.create(name: "Las Vegas Raiders")
chargers = SportsTeam.create(name: "Los Angeles Chargers")

cowboys = SportsTeam.create(name: "Dallas Cowboys")
giants = SportsTeam.create(name: "New York Giants")
eagles = SportsTeam.create(name: "Philadelphia Eagles")
redskins = SportsTeam.create(name: "Washinton Redskins")

bears = SportsTeam.create(name: "Chicago Bears")
lions = SportsTeam.create(name: "Detroit Lions")
packers = SportsTeam.create(name: "Green Bay Packers")
vikings = SportsTeam.create(name: "Minnesota Vikings")

falcons = SportsTeam.create(name: "Atlanta Falcons")
panthers = SportsTeam.create(name: "Carolina Panthers")
saints = SportsTeam.create(name: "New Orleans Saints")
buccaneers = SportsTeam.create(name: "Tampa Bay Buccaneers")

cardinals = SportsTeam.create(name: "Arizona Cardinals")
rams = SportsTeam.create(name: "Los Angeles Rams")
fortyniners = SportsTeam.create(name: "San Fransisco 49ers")
seahawks = SportsTeam.create(name: "Seattle Seahawks")

SportsTeam.shuffle_rank
league1 = FantasyLeague.create(name: "The One and Only")

sam = User.create(name: "Sam")
dan = User.create(name: "Dan")
tori = User.create(name: "Tori")
morgan = User.create(name: "Morgan")


league2 = FantasyLeague.create(name: "League 2")
league3 = FantasyLeague.create(name: "League 3")

dan.join_league(league1, "Dan's Team")
sam.join_league(league1, "Sam's Team")
league1.add_fantasy_team(tori, "Tori's Team")
morgans_team = league1.add_fantasy_team(morgan, "Morgan's Team")


sam.fantasy_teams[0].draft_team(bills)
dan.fantasy_teams[0].draft_team(packers)
tori.fantasy_teams[0].draft_team(patriots)
morgans_team.draft_team(chargers)

sams_team = sam.fantasy_teams[0]
dans_team = dan.fantasy_teams[0]
toris_team = tori.fantasy_teams[0]

league1.populate_league
league1.seed_schedule
