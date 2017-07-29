post '/questions/:id/answers/new' do
  authenticate!
  @question = Question.find_by(id: params[:id])
  @answer = @question.answers.new(body: params[:answer])
  @answer.author = current_user
  if @answer.save
    if request.xhr?
      erb :'answers/_answer_show', locals: { answer: @answer}, layout: false
    else
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = @answer.errors.full_messages
    erb :'questions/show'
  end
end

post '/answer/:id/comment' do
  @answer = Answer.find_by(id: params[:id])
  @comment = Comment.new(body: params[:comment], commentable_type: "Answer", commentable_id: params[:id], author_id: current_user.id)
  if @comment.save
    if request.xhr?
      erb :'answers/_answer_comments', locals: { comment: @comment }, layout: false
    else
      redirect back
    end
  else
    @errors = @answer.errors.full_messages
    erb :'questions/show'
  end
end
