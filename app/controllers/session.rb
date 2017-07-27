get '/session-viewer' do
  session.inspect
end

get '/sessions/new' do
  erb :'session/new'
end

post '/sessions' do
 @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password], params[:email])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["There was trouble logging you in, please try again."]
    erb :'/sessions/new'
  end
end
