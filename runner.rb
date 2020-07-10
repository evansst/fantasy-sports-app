require_relative 'config/environment'


app = Cli.new

fantasy_league = FantasyLeague.find_by(name: "The One and Only")

app.welcome

loop do
  case app.main_menu
  when 'Create a User name'
    app.create_user
  when 'Join a League'
    app.join_a_league
  when 'See all of the teams'
    app.show_the_league
  when 'Start the Draft'
    app.draft
  when 'Start a season'
    app.start_the_season
  when 'Check the Standings'
    app.show_standings
  when 'Go to next week'
    app.weekly_games
  when 'Finish the Season'
    app.finish_season
  when 'Exit'
    break
  end
end
