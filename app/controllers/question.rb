get '/home' do
  @questions = Question.all
  erb :"questions/home"
end

get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

post '/questions' do 
  if logged_in?
    @question = Question.create(params[:question])
    @question.author = current_user
    if @question.save
      redirect "/questions/#{@question.id}"
    else
      @errors = ["We're sorry, an error occurred with your post."]
      erb :'questions/new'
    end
  else
    @errors = ["You must be logged in to ask the community a question."]
    erb :'questions/new'
  end
end
