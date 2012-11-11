require 'yaml'
module Galleta
  class Post
    attr_accessor :title, :description, :keywords, :date, :markdown

    def initialize(name)
      yaml, @markdown = Post.split(name)

      metadata = YAML.parse(yaml).to_ruby
      @title = metadata["title"]
      @description = metadata["description"]
      @keywords = metadata["keywords"]
      @date = metadata["date"]
    end


    private

    #Reads the file and splits it into a yaml and a markdown
    def self.split(name)
      post = File.new("./posts/#{name}\.md").readlines

      yaml_separator = post.grep(/\-\n/)[1] #finds the second ocurrance of "--*"
      yaml_ends_index = post[1..-1].index(yaml_separator) #Finds the index of that ocurrance 

      yaml = post[1..yaml_ends_index].join # 2nd line to were it ends
      markdown = post[yaml_ends_index+1..-1].join #were YAML ends + 1 to the end
    
      return yaml, markdown
    end

  end
end
