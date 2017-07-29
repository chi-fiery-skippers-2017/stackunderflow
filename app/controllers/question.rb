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

post '/question/:id/comment' do
  @question = Question.find_by(id: params[:id])
  @comment = Comment.new(body: params[:comment], commentable_type: "Question", commentable_id: params[:id], author_id: current_user.id)
  if @comment.save
    if request.xhr?
      erb :'answers/_answer_comments', locals: { comment: @comment }, layout: false
    else
      redirect back
    end
  else
    @errors = @question.errors.full_messages
    erb :'questions/show'
  end
end
