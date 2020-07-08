require 'bundler/setup'
require "sinatra/activerecord"
require 'ostruct'
require 'date'
Bundler.require

require_all 'lib'
require_all 'app/models'

ENV["SINATRA_ENV"] ||= 'development'
ActiveRecord::Base.establish_connection(ENV["SINATRA_ENV"].to_sym)
# connection_details = YAML::load(File.open('config/database.yml'))
# ActiveRecord::Base.establish_connection(connection_details)