require_relative 'config/environment'
require 'sinatra/activerecord/rake'

require 'active_record'

task :environment do
  ENV["ACTIVE_RECORD_ENV"] ||= "development"
  require_relative './config/environment'
end

desc 'start console'
task :console => :environment do
  Pry.start
end