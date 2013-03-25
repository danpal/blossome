require 'bundler'
Bundler.require
require 'sinatra/partial'
require './app/config'
require './app/post'
require 'rdiscount'
require 'mustache'
require 'pry'

module Blossome 
  class Blog < Sinatra::Base
    register Sinatra::Partial

  @@config = Blossome::Config.new #loads ./config/config.yaml
    set :partial_template_engine, :haml
    set :environment, ENV["RACK_ENV"] || "test"
    set :show_exceptions, ENV["RACK_ENV"] == "development"


  ##
  # Blog index. Lists all posts
  ##
  get '/', :provides => 'html' do
    @description = @@config.description
    @keywords = @@config.keywords
    @title  = @@config.title
    @posts = get_active_posts
    haml :index
  end
 
  get '/', :provides => ['rss', 'atom', 'xml'] do
    # builder :feed
  end 

  get '/:post' do
    post = params[:post].gsub(/[^A-Za-z\-]/, "") #strip just in case
    @post = Post.new(post)
    @description = @post.description
    @keywords = @post.keywords
    @title  = @post.title
    haml :post
  end
  
  private 
    
    def get_active_posts
      posts = []
      Dir.foreach("./posts") do |file| 
        if file.end_with?(".md")
          post = Post.new(file)
          posts << post if post.time < Time.now 
        end
      end
      #sort posts by date
      posts.sort! {|x,y| y.time <=> x.time }
      return posts
    end

  end #class Application
end
