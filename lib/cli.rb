class Cli


    def start_game
        # font = TTY::Font.new(:3)
        puts font.write("Ultamate Fantasy Football League!")
        puts "Please enter your name(s)"
        loop do
        username = gets.strip
        user = User.create(name: username)
        puts "Hello #{username}!"
        break if username == nil
        end
        user
    end

    def select_a_league user
        puts "Choose your League"

        prompt = TTY::Prompt.new
        fantasy_league = FantasyLeague.all.pluck(:name)
        user_league = prompt.select("Choose your League", fantasy_league)
        user_league = FantasyLeague.find_by(name: user_league)
        puts "Please enter your fantasy team name"
        fantasy_team_name = gets.strip
        user.join_league(user_league, fantasy_team_name)
        user
    end

    def draft_a_team user
        puts "Below are the are all the teams"

        loop do
          prompt = TTY::Prompt.new
          sports_team_names = SportsTeam.all.pluck(:name)
          user_team = prompt.select("select a team", sports_team_names)
          user_team = SportsTeam.find_by(name: user_team)
          break if user.fantasy_teams[0].draft_team(user_team)
          puts "This team is already taken!"
        end
        puts "Congratulations, you have drafted the #{user.fantasy_teams[0].sports_team.name}!"

    end

    def start_the_season
    puts "Are you ready to start the season?"
    if (reply !='yes' || reply != 'no' ) # if something besides y/n
        puts ' Please answer "yes" or "no".'
    elsif reply == 'yes' 
#play_game
    else reply == 'no'
#back_start_game
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
