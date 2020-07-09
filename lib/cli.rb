class Cli

    def start_game
        puts "Welcome to the Ultamate fantasy League!"
        puts "Please enter your name"
        username = gets.strip

        puts "Hello #{username}!"
    end

    def select_a_team
        puts "Below are the ere are all the teams"

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

    # def player_play_game(user_team,computer_team)
        # FantasyLeague.play_a_game
    # end


end
