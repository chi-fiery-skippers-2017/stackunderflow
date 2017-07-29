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