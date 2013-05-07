require 'compass'
require 'sinatra'
require 'haml'

require 'data_mapper'
require './models/talk'
require './models/speaker'
require './models/slot'
require './models/sponsor'

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views/stylesheets'
    config.images_dir = 'images'
  end
  set :scss, Compass.sass_engine_options

  Dir.mkdir('db') unless Dir.exist?('db')
  
  # XXX: change this when switching in production
  db_name = File.join(Dir.pwd, "db", "rubyday_2013_dev.db")
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, "sqlite://#{db_name}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end

get '/stylesheets/:name.css' do
  scss :"stylesheets/#{params[:name]}.css"
end

get '/' do
  haml :'index.html'
end
