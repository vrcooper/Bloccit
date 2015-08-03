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

##1.times do
##Post.create!(
 ##title: "My atomic post!",
 ## body: "This post is absolutely fabulous!"
  
 #)
#end

post = Post.find_or_create_by(title: "My atomic post!", body:"This post is absolutely fabulous!")


#Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph

    )
end

#Create unique comment

#1.times do
#Comment.create!(
  #post: posts.first,
  #body: "I agree! Your post is atomic!"

  #)
#end

comment = Comment.find_or_create_by(post: post, body: "I agree! Your post is atomic!")


# Create advertisements
2.times do
  Advertisement.create!(
    title: "Extreme Juicing",
    copy: "http://www.rebootwithjoe.com", 
    price: "100"
    )
end

Advertisements = Advertisement.all


Advertisements = Advertisement.find_or_create_by(title:'Ultimate Weight Loss Solution', copy: 'http://www.biggestloser.com', price: '$150')

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
