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
  when 'Start the Draft'
    app.draft_a_team
  when 'Start a season'
    puts 'Coming soon!'
  when 'Check the Standings'
    puts 'Coming soon!'
  when 'Go to next week'
    puts 'Coming soon!'
  when 'Exit'
    break
  end
end
