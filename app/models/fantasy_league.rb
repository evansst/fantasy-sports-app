class FantasyLeague < ActiveRecord::Base
  has_many :fantasy_teams
  has_many :sports_teams, through: :fantasy_teams
  has_many :users, through: :fantasy_teams

  SCHEDULE = [
    [],
    [[1, 8], [2, 7], [3, 6], [4, 5]],
    [[7, 1], [6, 8], [5, 2], [4, 3]],
    [[1, 6], [7, 5], [8, 4], [2, 3]],
    [[5, 1], [6, 4], [3, 7], [8, 2]],
    [[1, 4], [5, 3], [6, 2], [7, 8]],
    [[3, 1], [2, 4], [8, 5], [7, 6]],
    [[1, 2], [3, 8], [4, 7], [5, 6]]
  ]

  def add_fantasy_team user, fantasy_team_name
    user.join_league(self, fantasy_team_name)
  end

  def self.list_all_leagues
    all.map(&:name)
  end

  def list_fantasy_teams
    FantasyTeam.where(fantasy_league_id: id)
  end

  def populate_league
    teams_needed = 8 - fantasy_teams.size
    teams_needed.times do
      new_user = User.create(name: Faker::FunnyName.name)
      new_team = add_fantasy_team(new_user, Faker::Team.creature.capitalize)
      new_user.update(computer: true)

      loop do
        break if new_team.draft_team(SportsTeam.all[rand(0..31)])
      end
    end
  end

  def seed_schedule
    list_fantasy_teams.shuffle.reduce(1) do |i, fantasy_team|
      fantasy_team.update(schedule_number: i)
      i + 1
    end
    update(week: 1)
  end



  def play_weekly_games
    SCHEDULE[week].each do |game|
      team1 = FantasyTeam.find_by(fantasy_league_id: id, schedule_number: game[0])
      team2 = FantasyTeam.find_by(fantasy_league_id: id, schedule_number: game[1])
      play_a_game(team1, team2)
    end
    update(week: week + 1)
  end

  def play_a_game fantasy_team1, fantasy_team2
    reload
    sports_team1 = fantasy_team1.sports_team
    sports_team2 = fantasy_team2.sports_team

    if sports_team1.rank < sports_team2.rank
      fantasy_team1.update(wins: fantasy_team1.wins + 1)
      puts "#{fantasy_team1.name} beat #{fantasy_team2.name}!"
    else
      fantasy_team2.update(wins: fantasy_team2.wins + 1)
      puts "#{fantasy_team2.name} beat #{fantasy_team1.name}!"
    end
  end

  def standings
    reload
    fantasy_teams.sort { |a, b| b.wins <=> a.wins }.map do |team|
      [team.name, team.wins]
    end
  end
end
