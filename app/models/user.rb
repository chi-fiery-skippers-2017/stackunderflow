class User < ActiveRecord::Base
  has_many  :questions, foreign_key: :author_id
  has_many  :comments, foreign_key: :author_id
  has_many  :votes, foreign_key: :voter_id
  has_many  :answers, foreign_key: :author_id

  validate_presence_of :username, :email, :password
  validate_uniqueness_of :email, :username

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(plain_text_password, email_address)
    self.password == plain_text_password && self.email == email_address
  end
end