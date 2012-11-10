require 'sinatra'
require 'rubygems'
require './app/blog'
require 'rspec'
require 'rack/test'
require 'pry'

set :environment, 'test'


RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
