enable :session
set :protection, except: :session_hijacking

# create tweet

post "/new_tweet" do
  @tweet = Tweet.create(post: params[:new_tweet], user_id: session[:user].id)
  @user = session[:user]
  @follower_id = []
  @followee_id = []
  redirect to("/users/#{@user.id}")
end

# view tweet
get '/tweet/:id' do

  @user = session[:user]
  # puts "----------------"
  # puts params
  @tweets = Tweet.where(id: params[:id])
  # puts @tweets.post
  erb :view_tweet
end

get '/users/:id' do
  # puts "---------------------"
  # puts params

  @user = User.find(params[:id])
  # @users = User.where(username: params[:username])
  @tweets = @user.tweets
  erb :profile
end