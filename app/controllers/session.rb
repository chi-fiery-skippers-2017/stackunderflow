
# Logout users
delete '/sessions/logout' do
  session.delete(:user_id)
  redirect '/'
end