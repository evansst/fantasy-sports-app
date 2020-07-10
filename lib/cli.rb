class Cli
  attr_accessor  :drafted, :user, :user_league
  def initialize
    load_users
  end

  PROMPT = TTY::Prompt.new

  def load_users
    User.all
  end

  def welcome
    banner
    launch_main_menu
  end

  def banner
    system "clear"
    font = TTY::Font.new(:standard)
    puts font.write('Ultamate')
    puts font.write('Fantasy')
    puts font.write('Football')
    puts font.write('League!')
    puts "Logged in as: #{@user.name}" if @user
  end

  def launch_main_menu
    banner
    loop do
      case main_menu
      when 'Create a User name'
        banner
        create_user
      when 'Log in'
        banner
        log_in
      when 'Delete Everything'
        banner
        delete_everything
      when 'Exit'
        puts 'Good Bye!'
        exit
      end
    end
  end

  def launch_user_menu
    banner
    puts "Hello #{@user.name}!"
    loop do
      case user_menu
      when 'Join a League'
        banner
        join_a_league
      when 'Select a League'
        banner
        select_a_league
      when 'Exit to Main Menu'
        banner
        launch_main_menu
      end
    end
  end
  
  def launch_league_menu
    banner
    puts "Welcome to #{@user_league.name}!"
    loop do
      case league_menu
      when 'See all of the teams'
        banner
        show_the_league
      when 'Start the Draft'
        banner
        draft
      when 'Check the Standings'
        banner
        show_standings
      when 'Play games'
        banner
        weekly_games
      when 'Finish the Season'
        banner
        finish_season
      when 'Exit to User Menu'
        banner
        launch_user_menu
      end
    end
  end
  
  def main_menu
    PROMPT.select('Main Menu') do |menu|
      menu.choice 'Create a User name'
      menu.choice 'Log in'
      menu.choice 'Delete Everything'
      menu.choice 'Exit'
    end
  end

  def user_menu
    PROMPT.select('User Menu') do |menu|
      menu.choice 'Join a League'
      menu.choice 'Select a League'
      menu.choice 'Exit to Main Menu'
    end
  end
  
  def league_menu
    PROMPT.select('League Menu') do |menu|
      menu.choice 'See all of the teams'
      menu.choice 'Start the Draft' unless @user_league.drafted
      menu.choice 'Check the Standings'
      menu.choice 'Play games'
      menu.choice 'Finish the Season'
      menu.choice 'Exit to User Menu'
    end
  end

  def delete_everything
    unless PROMPT.yes?("Are you sure you want to do this?  It cannot be undone.")
      return puts "Okay, come back when you're ready."
    end

    FantasyLeague.delete_all
    User.delete_all
    FantasyTeam.delete_all
    
    FantasyLeague.create(name: "League 1")
    FantasyLeague.create(name: "League 2")
    FantasyLeague.create(name: "League 3")
    puts 'Everything Fantasy Team and User has been deleted, and the Leagues have been reset'
  end

  def show_the_league
    @user_league.reload
    if @user_league.drafted
      @user_league.fantasy_teams.each do |team|
        puts "#{team.name}: \n   #{team.sports_team.name}"
      end
    else
      @user_league.fantasy_teams.each do |team|
        puts "#{team.name}"
      end
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
    @user = User.create(name: username)
    launch_user_menu
  end

  def log_in
    load_users
    @user = choose_a_user
    return puts 'Please create a user first!' unless @user

    launch_user_menu
  end

  def choose_a_user

    return nil if User.all.empty?

    users = User.where(computer: nil).pluck(:name)
    user = PROMPT.select('Which user?', users)
    User.find_by(name: user)
  end

  def select_a_league
    fantasy_leagues = @user.get_leagues.map(&:name)
    return puts 'You must join a league first!' if fantasy_leagues.empty?

    user_league = PROMPT.select('Choose your League', fantasy_leagues)
    @user_league = FantasyLeague.find_by(name: user_league)
    launch_league_menu
  end

  def join_a_league
    user = @user
    return puts 'You must create a username first!' unless user

    fantasy_league = FantasyLeague.all.pluck(:name)
    user_league = PROMPT.select('Choose your League', fantasy_league)
    @user_league = FantasyLeague.find_by(name: user_league)
    puts 'Please enter your fantasy team name'
    fantasy_team_name = gets.strip
    user.join_league(@user_league, fantasy_team_name)
    launch_league_menu
  end

  def draft
    return puts 'You have already drafted!' if @user_league.drafted
    unless PROMPT.yes?("Are you sure you're ready to draft? This cannot be undone")
      return puts "Okay, come back when you're ready."
    end

    @user_league.users.shuffle.each { |user| draft_a_team(user) }
    puts 'The rest of the league will be populated by computer players'
    @user_league.populate_league
    @user_league.drafted = true
    @user_league.seed_schedule
    show_the_league
  end

  def draft_a_team user
    puts "#{user.name}, you are on the clock!"
    puts 'Below are the are all of the available teams'

    sports_teams_left = SportsTeam.pluck(:name)
    user_team = PROMPT.select('select a team', sports_teams_left)
    user_team = SportsTeam.find_by(name: user_team)
    user.get_teams.find_by(fantasy_league_id: @user_league.id).draft_team(user_team)

    puts "Congratulations, you have drafted the #{user_team.name}!"
  end

  def start_the_season
    return 'You have to draft first!' unless @user_league.drafted

    @user_league.seed_schedule
    puts 'The schedule is out!'
  end

  def weekly_games
    @user_league.reload
    return puts 'The season is over!' if @user_league.week == 8
    return puts 'You must start the season!' unless @user_league.week

    SportsTeam.shuffle_rank
    puts "Week: #{@user_league.week}"
    @user_league.play_weekly_games
  end

  def finish_season
    @user_league.reload
    while weekly_games
      weekly_games
    end
  end

  def show_standings
    @user_league.reload
    @user_league.standings.reduce(1) do |rank, team|
      puts "#{rank}: #{team[0]} - #{team[1]} wins"
      rank + 1
    end
  end
end
