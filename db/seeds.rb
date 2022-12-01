Trip.destroy_all

10.times do

    created_at = Faker::Date.backward(days: 365 * 1)
    departure_date = Faker::Date.between(from: 5.days.ago, to: Date.today)
    return_date = Faker::Date.between(from: '2023-01-30', to: '2024-01-30')
    image_url = 'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'

    Trip.create(
        name: Faker::Lorem.sentence(word_count: 3),
        destination: Faker::Lorem.word,
        departure_date: departure_date,
        return_date: return_date,
        image_url: image_url,
        created_at: created_at,
        updated_at: created_at
    )

end

trips = Trip.all
puts Cowsay.say("Generated #{trips.count} trips", :cow)