class Answer < ActiveRecord::Base
  belongs_to  :question
  belongs_to  :author, class_name: User
  has_many  :votes, as: :votable
  has_many  :comments, as: :commentable

  validate_presence_of :body
end
