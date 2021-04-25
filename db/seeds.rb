# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# returns a random time like '54:37'
def rand_time
  # Map an array of random numbers between 0 and 59 to strings with exactly two digits
  times = [rand(0...60), rand(0...60)].map { |t| t < 10 ? "0#{t}" : t.to_s }
  times.join(':')
end

# 5.times do
#   User.create(cookie: SecureRandom.hex)
# end

25.times do
  Score.create(time: rand_time, user_id: 6)
end

