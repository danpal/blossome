require './app/blog'

map "/assets" do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.append_path 'app/assets/fonts'
  environment.append_path 'app/assets/images'
  run environment
end

map "/" do
  run Galleta::Blog
end

