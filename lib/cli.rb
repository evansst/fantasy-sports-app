class Cli

    def start_game
        puts "Welcome to the Ultamate fantasy League!"
        puts "Please enter your name"
        username = gets.strip

        puts "Hello #{username}!"
    end

    def select_a_team
        puts "Below are the are all the teams"

        prompt = TTY::Prompt.new
        team_names = SportsTeam.all.pluck(:name)
        user_team = prompt.select("select a team", team_names) 
    end

    def select_a_league
        puts "Choose your League"

        prompt = TTY::Prompt.new
        fantasy_league = FantasyLeague.all.pluck(:name)
        user_league = prompt.select("Choose your League", fantasy_league)

    end

    def game_options
        prompt = TTY::Prompt.new
        game_options = [play_game,view_record,choose_new_team]
        play_game = 
        user_choice = prompt.select("What would team #{username} like to do:")

    end

    def play_game
    end

    def view_record
        fantasy_league.standings
    end

    def choose_new_team
    end




    # def player_play_game(user_team,computer_team)
        # FantasyLeague.play_a_game
    # end


end
