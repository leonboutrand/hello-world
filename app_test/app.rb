require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
require "nokogiri"
require "open-uri"
require_relative 'lib/cookbook'
require_relative 'lib/recipe'
set :bind, '0.0.0.0'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

# exec in terminal : bundle exec ruby app.rb

get '/' do
  erb :index
end
