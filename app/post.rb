require 'yaml'
require 'rdiscount'

module Galleta
  class Post
    attr_accessor :title, :description, :keywords, :date, :markdown, :html_content, :time, :url
          

    def initialize(name)
      yaml, @markdown = Post.split(name)

      metadata = YAML.parse(yaml).to_ruby
      @title = metadata["title"]
      @description = metadata["description"]
      @keywords = metadata["keywords"]
      @date = metadata["date"]
      @html_content = RDiscount.new(@markdown).to_html
      @time = date_to_time(@date) 
      @url = name.end_with?(".md") ? name[0..-4] : name 
    end


    private

    #
    # Reads the file and splits it into a yaml and a markdown
    #
    def self.split(name)
      
      name += ".md" if !name.end_with?(".md")
      post = File.new("./posts/#{name}").readlines

      yaml_separator = post.grep(/\-\n/)[1] #finds the second ocurrance of "--*"
      yaml_ends_index = post[1..-1].index(yaml_separator) #Finds the index of that ocurrance 

      yaml = post[1..yaml_ends_index].join # 2nd line to were it ends
      markdown = post[yaml_ends_index+1..-1].join #were YAML ends + 1 to the end
    
      return yaml, markdown
    end


    def date_to_time(date)  
      parts = date.gsub(",","").split(" ")
      #Time.new(year, month, date). Month has to be a 3 digits of the month
      time = Time.new(parts[2].to_i, parts[0][0..2], parts[1].to_i)
      return time
    end
  end
end
