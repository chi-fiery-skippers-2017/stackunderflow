get '/votes/up' do
  if request.xhr?
    Vote.create(votable_id: params[:votable_id], votable_type: params[:votable_type], voter_id:session[:id], vote: 1)
    Vote.where("votable_type = ? and votable_id = ?",params[:votable_type], params[:votable_id]).map(&:vote).reduce(:+).to_s
  else
    Vote.create(votable_id: params[:votable_id], votable_type: params[:votable_type], voter_id:session[:id], vote: 1)
    redirect back
  end
end

get '/votes/down' do
  if request.xhr?
    Vote.create(votable_id: params[:votable_id], votable_type: params[:votable_type], voter_id:session[:id], vote: -1)
    Vote.where("votable_type = ? and votable_id = ?",params[:votable_type], params[:votable_id]).map(&:vote).reduce(:+).to_s
  else
    Vote.create(votable_id: params[:votable_id], votable_type: params[:votable_type], voter_id:session[:id], vote: -1)
    redirect back
  end
end
