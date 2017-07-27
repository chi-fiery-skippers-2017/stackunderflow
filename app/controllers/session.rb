get '/sessions/new' do
  erb :'session/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
  session[:user_id]=@user.id
  session[:email]=@user.email
  redirect "/"
end
