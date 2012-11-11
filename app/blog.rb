require 'bundler'
Bundler.require
require 'sinatra/partial'
require './app/config'
require './app/post'
require 'rdiscount'
require 'pry'

module Galleta
  class Blog < Sinatra::Base
    register Sinatra::Partial    

  set :partial_template_engine, :haml    
  set :environment, :develpment 

  @@config = Galleta::Config.new #loads ./config/config.yaml


  ##
  # Blog index. Lists all posts
  ##
  get '/', :provides => 'html' do
    @description = @@config.description
    @keywords = @@config.keywords
    @title  = @@config.title
    haml :index
  end
 
  get '/', :provides => ['rss', 'atom', 'xml'] do
    # builder :feed
  end 

  get '/:post' do
    post = params[:post].gsub(/[^A-Za-z\-]/, "") #strip just in case
    @post = Post.new(post)
    @post_content = RDiscount.new(@post.markdown).to_html
    haml :post
  end

  end #class Application
end
