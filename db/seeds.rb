10.times do
    User.create(username: Faker::Internet.user_name,
                email: Faker::Internet.free_email,
                password: Faker::Internet.password)
end

20.times do
    Question.create(title: Faker::Book.title,
                body: Faker::Hipster.sentence,
                view_count: rand(1..100),
                author_id: rand(1..10))
end

20.times do
    Comment.create(body: Faker::Hipster.paragraph,
                  commentable_type: 'question',
                  commentable_id: rand(1..20),
                  author_id: rand(1..10))
end


30.times do
    Answer.create(body: Faker::Hipster.sentence,
                  question_id: rand(1..20),
                  author_id: rand(1..10))
end

20.times do
    Comment.create(body: Faker::Hipster.paragraph,
                  commentable_type: 'answer',
                  commentable_id: rand(1..30),
                  author_id: rand(1..10))
end

100.times do
    Vote.create(voter_id: rand(1..10),
                votable_type: 'question',
                votable_id: rand(1..20))
  end

100.times do
    Vote.create(voter_id: rand(1..10),
                votable_type: 'answer',
                votable_id: rand(1..30))
end
