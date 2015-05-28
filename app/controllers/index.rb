get '/' do
  if session[:user] != nil
    erb :index
  else
    redirect "/login"
  end
end


get '/login' do
  erb :login
end

post '/login' do
  if User.find_by(email: params[:email])
    user = User.find_by(email: params[:email])
  else
    session[:error] = "Incorrect Credentials"
    redirect '/login'
  end

  if user.authenticate(params[:password])
    session[:user] = user.id
    session.delete(:error )
  else
    session[:error] = "Incorrect Credentials"
    redirect '/login'
  end
  redirect '/'
end


get '/logout' do
  erb :index
end

post '/logout' do
  session.delete(:user)
  redirect '/'
end




get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  user = User.create(email:params[:email], password:params[:password])
  session[:user] = user.id
  redirect "/"
end










