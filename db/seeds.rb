sa = "1546 MacPherson Drive, New Haven, IN 46774"
ea = "1573 Dundee Drive, New Haven, IN 46774"

am = {}

User.create!(name:  "Example Admin User",
             email: "example_admin@example.com",
             password:              "adminfoobar",
             password_confirmation: "adminfoobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now).workorders.create!(address: sa, destination: ea).update()
            
User.create!(name:  "Example Basic User",
             email: "example_basic@example.com",
             password:              "basicfoobar",
             password_confirmation: "basicfoobar",
             activated: true,
             activated_at: Time.zone.now)

50.times do |n|
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