set :protection, except: :session_hijacking

post '/signup' do
  # session[:error] = nil
  user = User.create(params[:user])
  @message = "Signed up. Please login below."
  session[:user] = user
  erb :view_tweet
end

post '/login' do
  # session[:error] = nil
  # puts params
  @user = User.authenticate(params[:username], params[:password])

  if @user
    session[:user] = @user
    erb :view_tweet
  else
    @message = "No such user! Please try again or sign up for a new account."
    erb :index
  end
end

post '/logout' do
  session[:user] = nil
  redirect to ('/')
end