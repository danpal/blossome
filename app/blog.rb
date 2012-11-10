require 'bundler'
Bundler.require
require 'sinatra/partial'

module Galleta
  class Blog < Sinatra::Base
    register Sinatra::Partial    

  set :partial_template_engine, :haml    

  ##
  # Blog index. Lists all posts
  ##
  get '/' do
    haml :index
  end


  end #class Application
end
