get '/' do

  erb :index
  # redirect "/login"
end

get '/login' do
  erb :login
end

post '/login' do
  # if User.find_by(email: params[:email])
    # user = User.find_by(email: params[:email])
  # else
  #   session[:error] = "Incorrect "
  #   redirect '/login'
  # end

  # if user.authenticate(params[:password])
  #   session[:user] = user.id
  #   session.delete(:error )
  # end
  redirect '/'
end
