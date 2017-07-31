get '/votes/up' do
  if logged_in?
    if request.xhr?
      Vote.find_or_create_by(votable_id: params[:votable_id], votable_type: params[:votable_type], voter_id:session[:id], vote: 1)
      Vote.where("votable_type = ? and votable_id = ?",params[:votable_type], params[:votable_id]).map(&:vote).reduce(:+).to_s
    else
      Vote.find_or_create_by(votable_id: params[:votable_id], votable_type: params[:votable_type], voter_id:session[:id], vote: 1)
      redirect back
    end
  else
     if request.xhr?
      Vote.where("votable_type = ? and votable_id = ?",params[:votable_type], params[:votable_id]).map(&:vote).reduce(:+).to_s
    else
      redirect back
    end
  end
end

get '/votes/down' do
  if logged_in?
    if request.xhr?
      Vote.find_or_create_by(votable_id: params[:votable_id], votable_type: params[:votable_type], voter_id:session[:id], vote: -1)
      Vote.where("votable_type = ? and votable_id = ?",params[:votable_type], params[:votable_id]).map(&:vote).reduce(:+).to_s
    else
      Vote.find_or_create_by(votable_id: params[:votable_id], votable_type: params[:votable_type], voter_id:session[:id], vote: -1)
      redirect back
    end
  else
     if request.xhr?
      Vote.where("votable_type = ? and votable_id = ?",params[:votable_type], params[:votable_id]).map(&:vote).reduce(:+).to_s
    else
      redirect back
    end
  end
end
