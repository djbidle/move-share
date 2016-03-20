User.create!(name:  "Example Admin User",
             email: "example_admin@example.com",
             password:              "adminfoobar",
             password_confirmation: "adminfoobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Example Basic User",
             email: "example_basic@example.com",
             password:              "basicfoobar",
             password_confirmation: "basicfoobar",
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.net"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end