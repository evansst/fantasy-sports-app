require_relative 'config/environment'


app = Cli.new

user = app.start_game

user = app.select_a_league(user)

app.draft_a_team(user)


# app.game_options

# app.play_game

app.view_record
#puts name = gets.strip
#puts "Welcome #{name}"

#puts team = gets.Sports_teams
#puts "#{name} has selected #{team}"
