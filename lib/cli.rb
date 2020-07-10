class Cli
  attr_accessor :users, :drafted
  attr_reader :league
  def initialize
    @users = []
    @drafted = false
    @league = FantasyLeague.find_by(name: "The One and Only")
    @league.reload
  end

  PROMPT = TTY::Prompt.new


  def welcome
    font = TTY::Font.new(:standard)
    puts font.write('Ultamate')
    puts font.write('Fantasy')
    puts font.write('Football')
    puts font.write('League!')
  end

  def main_menu
    PROMPT.select('Main Menu') do |menu|
      menu.choice 'Create a User name'
      menu.choice 'Join a League'
      menu.choice 'See all of the teams'
      menu.choice 'Start the Draft'
      menu.choice 'Start a season'
      menu.choice 'Check the Standings'
      menu.choice 'Go to next week'
      menu.choice 'Finish the Season'
      menu.choice 'Exit'
    end
  end

  def show_the_league
    @league.fantasy_teams.each do |team|
      puts "#{team.name}: \n   #{SportsTeam.find_by(fantasy_team_id: team.id).name}"
    end
  end

  def create_user
    username = ''
    loop do
      puts 'Please enter your name(s)'
      username = gets.strip
      user = User.find_by(name: username)
      puts 'Sorry, that username is taken' if user
      break unless user
    end
    @users << User.create(name: username)
    puts "Hello #{username}!"
  end

  def choose_a_user
    return nil if @users.empty?

    users = User.where(computer: nil).pluck(:name)
    user = PROMPT.select('Which user?', users)
    User.find_by(name: user)
  end

  def join_a_league
    user = choose_a_user
    return puts 'You must create a username first!' unless user

    fantasy_league = FantasyLeague.all.pluck(:name)
    user_league = PROMPT.select('Choose your League', fantasy_league)
    user_league = FantasyLeague.find_by(name: user_league)
    puts 'Please enter your fantasy team name'
    fantasy_team_name = gets.strip
    user.join_league(user_league, fantasy_team_name)
  end

  def draft
    return puts 'You have already drafted!' if @drafted
    unless PROMPT.yes?("Are you sure you're ready to draft? This cannon be undone")
      return puts "Okay, come back when you're ready."
    end

    @users.shuffle.each { |user| draft_a_team(user) }
    puts 'The rest of the league will be populated by computer players'
    @league.populate_league
    @users = FantasyTeam.where(fantasy_league_id: @league.id)
    @drafted = true
    show_the_league
  end

  def draft_a_team user
    puts "#{user.name}, you are on the clock!"
    puts 'Below are the are all of the available teams'

    sports_teams_left = SportsTeam.where(fantasy_team_id: nil).pluck(:name)
    user_team = PROMPT.select('select a team', sports_teams_left)
    user_team = SportsTeam.find_by(name: user_team)
    user.fantasy_teams[0].draft_team(user_team)

    puts "Congratulations, you have drafted the #{user.fantasy_teams[0].sports_team.name}!"
  end

  def start_the_season
    return 'You have to draft first!' unless @drafted

    @league.seed_schedule
    puts 'The schedule is out!'
  end

  def weekly_games
    return puts 'The season is over!' if @league.week == 8
    return puts 'You must start the season!' unless @league.week

    SportsTeam.shuffle_rank
    @league.play_weekly_games
  end

  def finish_season
    while weekly_games
      weekly_games
    end
  end

  def show_standings
    @league.standings.reduce(1) do |rank, team|
      puts "#{rank}: #{team[0]} - #{team[1]} wins"
      rank + 1
    end
  end




  # def game_options
  #     prompt = TTY::Prompt.new
  #     game_options = [play_game,view_record,choose_new_team]
  #     play_game = 
  #     user_choice = prompt.select("What would team #{username} like to do:")

  # end

  def play_game

  end

  def view_record
    Fantasy.standings.name
  end

  def choose_new_team

  end
  
  # def player_play_game(user_team,computer_team)
  # FantasyLeague.play_a_game
  # end


end
