require_relative 'config/environment'


app = Cli.new

fantasy_league = FantasyLeague.find_by(name: "League 1")

user = app.start_game

user = app.select_a_league(user)

user = app.draft_a_team(user)

fantasy_league.populate_league
fantasy_league.seed_schedule
7.times do
  fantasy_league.play_weekly_games
  SportsTeam.shuffle_rank
end

puts fantasy_league.standings


# app.game_options

# app.play_game

# app.view_record
#puts name = gets.strip
#puts "Welcome #{name}"

#puts team = gets.Sports_teams
#puts "#{name} has selected #{team}"
