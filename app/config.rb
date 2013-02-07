require 'yaml'
module Blossome
  class Config
    attr_accessor :title, :description, :keywords
    def initialize
      config = YAML.load_file('./config/config.yml')
      @title = config["blog"]["title"]
      @description = config["blog"]["description"]
      @keywords = config["blog"]["keywords"]
    end
  end
end
