require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
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


#Create Random Posts
50.times do
  Post.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

# Create unique post if does not already exist
#Post.where(user: "Jax", title: "Jax Unique Seed Title", body: "Jax Unique Seed Body Data").first_or_create!

posts = Post.all

#Create Comments
100.times do 
  Comment.create!(
    # user: users.sample,   # we have not yet associated Users with Comments
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

# Create unique comment if does not already exist
Comment.where(post: "Jax Unique Seed Post", body: "Jax Unique Seed Body Data").first_or_create!

#Create Random Questions
5.times do
  Question.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

# Create unique question if does not already exist
Question.where(title: "Jax Unique Question", body: "Jax Unique Question body text").first_or_create!

questions = Question.all

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  name: 'Jax',
  email: 'jaxtel4219@gmail.com',
  password: 'jack2000'
  )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
