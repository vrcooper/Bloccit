require 'faker'

#Create Users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Note: by calling 'User.new' instead of 'create',
# we create an instance of User which isn't immediately saved to the database.

# The 'skip_confirmation!' method sets the 'confirmed_at' attribute
# to avoid triggering a confirmation email when the User is saved.

# The 'save' method then saves this User to the database.

# Create Topics
15.times do
  Topic.create!(
    name:  Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
     )
end
topics = Topic.all

#Create Posts
50.times do 
  Post.create!(
    user:  users.sample,
    topic: topics.sample,
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

#post = Post.find_or_create_by(title: "My atomic post!", body:"This post is absolutely fabulous!")


#Create Comments
100.times do
  Comment.create!(
    user: users.sample, # we have not yet associated Users with Comments
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

#comment = Comment.find_or_create_by(post: post, body: "I agree! Your post is atomic!")


# Create advertisements

#advertisement = Advertisement.find_or_create_by(title:'Ultimate Weight Loss Solution', body: 'http://www.rebootwithjoe.com', price: '100')

#user = User.first
#user.skip_reconfirmation!
#user.update_attributes!(
  #email: 'vcooper_us@yahoo.com',
  #password: 'helloworld'
  #)

#Create an admin user

admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )

  admin.skip_confirmation!
  admin.save!

  # Create a moderator

  moderator = User.new(
    name: 'Moderator User',
    email: 'moderator@example.com',
    password: 'helloworld',
    role: 'moderator'
    )

  moderator.skip_confirmation!
  moderator.save!

  # Create a member

  member = User.new(
    name: 'Member User',
    email: 'member@example.com',
    password: 'helloworld'
    )

  member.skip_confirmation!
  member.save!


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Topic.count} topics created"
