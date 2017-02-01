require 'faker'

 # Create Submissions
 50.times do
   Submission.create!(
     title:  Faker::Lorem.sentence,
     url:   Faker::Internet.domain_name
   )
 end
 submissions = Submission.all

 # Create Comments
 100.times do
   Comment.create!(
     submission: submissions.sample,
     body: Faker::Lorem.paragraph
   )
 end

 puts "Seed finished"
 puts "#{Submission.count} submissions created"
 puts "#{Comment.count} comments created"
