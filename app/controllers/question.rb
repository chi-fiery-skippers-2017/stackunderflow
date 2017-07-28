get '/home' do
  @questions = Question.all
  erb :"questions/home"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end
