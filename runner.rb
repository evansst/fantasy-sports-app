require_relative 'config/environment'


app = Cli.new

app.start_game

app.select_a_team

app.select_a_league

app.game_options

app.play_game

app.view_record
#puts name = gets.strip
#puts "Welcome #{name}"

#puts team = gets.Sports_teams
#puts "#{name} has selected #{team}"
