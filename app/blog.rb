require 'bundler'
Bundler.require
require 'sinatra/partial'
require './app/config'

module Galleta
  class Blog < Sinatra::Base
    register Sinatra::Partial    

  set :partial_template_engine, :haml    
  
  @@config = Galleta::Config.new #loads ./config/config.yaml


  ##
  # Blog index. Lists all posts
  ##
  get '/' do
    @description = @@config.description
    @keywords = @@config.keywords
    @title  = @@config.title
    haml :index
  end


  end #class Application
end
