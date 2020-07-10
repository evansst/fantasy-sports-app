# Fantasy Football Simulator

## General Info

Fantasy Football Simulator is a CLI application that allows multiple users to simulate a 7 week fantasy football season.  The users can draft real NFL teams, then simulate wins and losses and declare a winner!

## Required Technology

- Ruby - 2.6.1
- ActiveRecord - 6.0
- Sinatra - 2.0
- SQLite3 - 1.4
- TTY-Prompt - 0.21.0
- TTY-Font - 0.5.0
- Pry - 0.12.2

## Setup

To simulate a season:

1. Clone the githut repository to your computer.
2. In the root directory of this repository, enter the command: `bundle install`
3. In the root directory of this repository, enter the command: `ruby runner.rb`

## How to use Fantasy Football Simulator

1. Now, to run the application again, just entre the command: `ruby runner.rb` in the root directory.
1. You will see the Main Menu with the following options:
   - Create a username
     - Creates a new username.
   - Log in
     - Log in to an existing username, and access the User Menu.
   - Delete Everything.
     - Deletes all of the existing usernames and their fantasy teams.
   - Exit
     - Exits the application.
1. You must create a username before you can log in.
1. After you create a username, you are taken to the User Menu.  From there you can:
   - Join a Fantasy League
   - Select a Fantasy League you have already joined
   - Return to the Main Menu
1. When you have selected a league, you will be taken to the League Menu:
   - See all of the teams in the league.
   - Start a fantasy draft for the league.
   - Sheck the current standings.
   - Play the next week's games.
   - Play all of the games through the end of the season.
   - Exit to the User Menu.



## Code Examples


### Steps to setup Ruby app with activerecord
(New for ActiveRecord 6.0)


## The following steps are already done for you in this boiler plate repo. 
## The steps below are provided to you as a reference only. 
## You're not expected to memorize this (please don't).


1. In root of project, run `bundle init`
1. Add gems: 
  `bundle add activerecord pry sinatra, sinatra-activerecord rake sqlite3 require_all`
  run `bundle install`
1. mkdir config and lib 
1. mkdir lib/models
1. touch config/environment.rb config/database.yml
1. Create your model files and models (make sure to have your models inherit from ActiveRecord::Base)
1. In config/environment.rb:
```
  require 'bundler/setup'
  Bundler.require

  require_all 'lib'
```
1. In config/database.yml:
  ```
  development:
    adapter: sqlite3
    database: db/cats.sqlite3
  ```
1. Touch Rakefile - require ‘config/environment.rb’ and require_relative ‘sinatra/activerecord/rake’ 
1. Run rake -T to make sure we have access to raketasks
1. Run `rake db:create_migration NAME=create_cats_table` (will create the db folder if it doesn’t already exist) and will add the migration file to db/migration
1. Write migration file, then run `rake db:migrate`
1. Then can see schema in file structure, can also drop into sqlite3 cats.db to see the tables and schema, but don’t really need to do that anymore. *Review rollback here*
1. Create seeds in db/seeds.rb and run `rake db:seed`
1. Now can put a pry in environment.rb to run <ModelName>.all and see your seeds.

Make sure your models inherit from `ActiveRecord::Base`