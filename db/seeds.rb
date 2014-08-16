# Set up users
begin
  puts "Creating Users"
  users = []

  30.times do |i|
    users << {
      email: Faker::Internet.email,
      password: "mypassword",
      password_confirmation: "mypassword",
      role: "member"
    }
  end

  ActiveRecord::Base.connection.execute("TRUNCATE TABLE users")
  User.create({:email => "admin@forum.local", :role => "admin", :password => "mypassword", :password_confirmation => "mypassword" })
  User.create(users)
ensure
  users = nil
end

# Set up some sections
begin
  puts "Creating Sections"
  categories = Faker::Lorem::words(5, false)
  sections = []

  20.times do |i|
    sections << {
      order: i + 1,
      category: categories[i % categories.length - 1],
      title: Faker::Lorem.words(rand(1..2), false).join(' '),
      description: Faker::Lorem.words(rand(4..10), false).join(' ')
    }
  end

  ActiveRecord::Base.connection.execute("TRUNCATE TABLE sections")
  Section.create(sections)
ensure
  categories, sections = nil
end

# Set up some posts
begin
  puts "Creating Posts"
  posts = []
  users = User.all
  sections = Section.all

  200.times do |i|
    posts << {
      title: Faker::Lorem.words(rand(4..10), false).join(' '),
      body: Faker::Lorem.words(rand(5..60), false).join(' '),
      user: users.sample,
      section: sections.sample
    }
  end

  ActiveRecord::Base.connection.execute("TRUNCATE TABLE posts")
  Post.create(posts)
ensure
  posts = nil
  users = nil
  sections = nil
end


# Set up some replies
begin
  puts "Creating Replies"
  replies = []
  posts = Post.all
  users = User.all

  630.times do |i|
    replies << {
      post: posts.sample,
      title: Faker::Lorem.words(rand(4..10), false).join(' '),
      body: Faker::Lorem.words(rand(5..60), false).join(' '),
      user: users.sample
    }
  end

  ActiveRecord::Base.connection.execute("TRUNCATE TABLE replies")
  Reply.create(replies)
ensure
   replies, posts, sections = nil
end