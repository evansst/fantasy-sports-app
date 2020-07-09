require 'bundler/setup'
require "sinatra/activerecord"
require 'ostruct'
require 'date'
require 'faker'
Bundler.require

require_all 'lib'
require_all 'app/models'


ENV["SINATRA_ENV"] ||= 'development'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')
