get "/" do
    # Look in app/views/index.erb

  @tweets = Tweet.all
  erb :index
end