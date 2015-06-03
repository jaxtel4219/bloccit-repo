require 'faker'

#Create Random Posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

# Create unique post if does not already exist
Post.where(title: "Jax Unique Seed Title", body: "Jax Unique Seed Body Data").first_or_create!

posts = Post.all

#Create Comments
100.times do 
  Comment.create!(
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

puts "Seed finished"
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"


