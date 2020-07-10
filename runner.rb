require_relative 'config/environment'


app = Cli.new

fantasy_league = FantasyLeague.find_by(name: "The One and Only")

app.welcome


