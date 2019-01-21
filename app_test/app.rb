require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
#require "nokogiri"
require "open-uri"
set :bind, '0.0.0.0'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

# exec in terminal : bundle exec ruby app.rb

get '/' do
  erb :authentify
end

post '/connect' do
  @username = params[:username]
  p @username
  @password = params[:password]
  p @password
  if @password == "lol"
    erb :index
  else
    erb :authentify
  end
end
