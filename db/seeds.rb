Trip.destroy_all
User.destroy_all

users = User.all

PASSWORD = "123"
super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "admin@user.com",
    password: PASSWORD,
    admin?: true
)

10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    User.create(
        first_name: first_name,
        last_name: last_name,
        email:"#{first_name}@#{last_name}.com",
        password: PASSWORD,
        admin?: false
    )
end

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
        updated_at: created_at,
        user: users.sample
    )

end

trips = Trip.all


puts Cowsay.say("Generated #{trips.count} trips", :cow)
puts Cowsay.say("Generated #{users.count} users", :sheep)