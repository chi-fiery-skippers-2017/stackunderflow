get '/home' do
  @questions = Question.all
  erb :"questions/home"
end
