require 'faker'

#Create Posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph

    )
end

posts = Post.all

#Create unique post

Post.create!(
  title: "My atomic post!",
  body: "This post is absolutely fabulous!"
  
  )




#Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph

    )
end

#Create unique comment

Comment.create!(
  post: posts.post,
  body: "I agree! Your post is atomic!"

  )

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
