puts "🌱 Seeding spices..."

# Seed your database here
#Quote.create(author: Faker::Name.unique.name, content: Faker::Quote.famous_last_words)
#Quote.create(author: Faker::Name.unique.name, content: Faker::Quote.famous_last_words)
#Quote.create(author: Faker::Name.unique.name, content: Faker::Quote.famous_last_words)
#Quote.create(author: Faker::Name.unique.name, content: Faker::Quote.famous_last_words)
# Seed your database here
#Quote.all.each do |quote|
 #   3.times do 
  #  Comment.create(comment: Faker::Lorem.sentence, like: false ,quote_id: quote.id, user_id: quote.id)
   # end
#end


# Make 10 users
10.times do
  User.create(name: Faker::Name.unique.name)
end

# Make 20 quotes
20.times do
  # create a quote with random data
  quote = Quote.create(
    author: Faker::Name.unique.name, 
    content: Faker::Quote.famous_last_words
  )
  
  # create between 1 and 5 comments for each quote
  rand(1..5).times do
    # get a random user for every review
    # https://stackoverflow.com/a/25577054
    user = User.order('RANDOM()').first

    # A comment belongs to a quote and a user, so we must provide those foreign keys
    Comment.create(
      comment: Faker::Lorem.sentence, 
      like: false,
      quote_id: quote.id,
      user_id: user.id
    )
  end
end


puts "✅ Done seeding!"
