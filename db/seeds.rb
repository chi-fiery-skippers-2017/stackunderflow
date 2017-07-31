10.times do
    User.create(username: Faker::Internet.user_name,
                email: Faker::Internet.free_email,
                password: "password")
end

20.times do
    Question.create(title: Faker::Book.title,
                body: Faker::TwinPeaks.quote,
                view_count: rand(1..100),
                author_id: rand(1..10))
end

20.times do
    Comment.create(body: Faker::MostInterestingManInTheWorld.quote,
                  commentable_type: 'Question',
                  commentable_id: rand(1..20),
                  author_id: rand(1..10))
end


30.times do
    Answer.create(body: Faker::TwinPeaks.quote,
                  question_id: rand(1..20),
                  author_id: rand(1..10))
end

20.times do
    Comment.create(body: Faker::MostInterestingManInTheWorld.quote,
                  commentable_type: 'Answer',
                  commentable_id: rand(1..30),
                  author_id: rand(1..10))
end

100.times do
    Vote.create(voter_id: rand(1..10),
                votable_type: 'Question',
                votable_id: rand(1..20),
                vote: 1)
  end

100.times do
    Vote.create(voter_id: rand(1..10),
                votable_type: 'Answer',
                votable_id: rand(1..30),
                vote: 1)
end
