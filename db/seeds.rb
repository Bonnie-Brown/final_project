Trip.destroy_all

10.times do

    created_at = Faker::Date.backward(days: 365 * 5)

    Trip.create(
        name: Faker::Lorem.sentence(word_count: 3),
        destination: Faker::Lorem.word,
        created_at: created_at,
        updated_at: created_at
    )

end

trips = Trip.all
puts Cowsay.say("Generated #{trips.count} trips", :cow)