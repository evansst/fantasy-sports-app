require 'bundler/setup'
require "sinatra/activerecord"
require 'ostruct'
require 'date'
require 'faker'
Bundler.require

require_all 'lib'
require_all 'app/models'

ActiveRecord::Base.logger = nil
