get '/auth/twitter/callback' do
  # byebug
  env['omniauth.auth'] ? session[:admin] = true : halt(401,'Not Authorized')
  "You are now logged in"
  "<h1>Hi #{env['omniauth.auth']['info']['name']}!</h1><img src='#{env['omniauth.auth']['info']['image']}'>"
  @user = TwitterUser.find_or_created_by_username(env['omniauth.auth'])
  session[:username] = @user.twitter_username
  redirect '/user'
end

get '/auth/failure' do
  params[:message]
end

get '/user' do

  erb :user
end