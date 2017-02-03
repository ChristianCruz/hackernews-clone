require 'faker'

# Create Users
5.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Note: by calling `User.new` instead of `create`,
# we create an instance of User which isn't immediately saved to the database.

# The `skip_confirmation!` method sets the `confirmed_at` attribute
# to avoid triggering an confirmation email when the User is saved.

# The `save` method then saves this User to the database.

# Create Submissions
50.times do
 Submission.create!(
   user:   users.sample,
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


# Create an admin user
admin = User.new(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
  email:    'moderator@example.com',
  password: 'helloworld',
  role:     'moderator'
)
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
  email:    'member@example.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{Submission.count} submissions created"
puts "#{Comment.count} comments created"
