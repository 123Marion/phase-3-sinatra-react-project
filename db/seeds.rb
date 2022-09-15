puts "🌱 Seeding spices..."

# Seed your database here
Quote.create(author: Faker::Name.unique.name, content: Faker::Quote.famous_last_words)
Quote.create(author: Faker::Name.unique.name, content: Faker::Quote.famous_last_words)
Quote.create(author: Faker::Name.unique.name, content: Faker::Quote.famous_last_words)
Quote.create(author: Faker::Name.unique.name, content: Faker::Quote.famous_last_words)
User.create(name: Faker::Name.unique.name)
# Seed your database here
Quote.all.each do |quote|
    3.times do 
    Comment.create(comment: Faker::Lorem.sentence, like: false ,quote_id: quote.id, user_id: quote.id)
    end
end

puts "✅ Done seeding!"
