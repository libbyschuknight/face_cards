get '/' do
  if session[:user] != nil
    redirect "/index"
  else
    redirect "/login"
  end
end

get '/index' do
  @user = User.find_by(id: session[:user])
  @user_stacks = @user.stacks
  erb :index
end

get '/login' do
  @errors = session[:errors]
  session[:errors] = nil
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
  redirect '/'
end

post '/logout' do
  session.delete(:message)
  session.delete(:user)
  redirect '/'
end


get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  user = User.create(email:params[:email], password:params[:password])
  if user
    session[:user] = user.id
    redirect '/'
  else
    erb :sign_up
  end
end

# get '/show' do
#   redirect '/'
# end


get '/show/:id' do
  @stack = Stack.find(params[:id])
  # @facecard = Facecard.all.sample
  @facecard = Facecard.all.where(guessed: false).sample
  erb :show
end

post '/guess' do
  @stack = Stack.find(params[:stack])
  session.delete(:message)
  @facecard = Facecard.find(params[:id])
  if @facecard.name == params[:name]
    @facecard.guessed = true
    session[:message] = "Correct!"
    redirect "/show/#{params[:stack]}"
  else
    session[:message] = "Try Again!"
    erb :show
  end

end









