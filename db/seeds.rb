addr = ["777 Brockton Avenue, Abington MA 2351",
        "30 Memorial Drive, Avon MA 2322",
        "250 Hartford Avenue, Bellingham MA 2019",
        "700 Oak Street, Brockton MA 2301",
        "66-4 Parkhurst Rd, Chelmsford MA 1824",
        "591 Memorial Dr, Chicopee MA 1020",
        "55 Brooksby Village Way, Danvers MA 1923",
        "137 Teaticket Hwy, East Falmouth MA 2536",
        "42 Fairhaven Commons Way, Fairhaven MA 2719",
        "374 William S Canning Blvd, Fall River MA 2721",
        "121 Worcester Rd, Framingham MA 1701",
        "677 Timpany Blvd, Gardner MA 1440",
        "337 Russell St, Hadley MA 1035",
        "295 Plymouth Street, Halifax MA 2338",
        "1775 Washington St, Hanover MA 2339",
        "280 Washington Street, Hudson MA 1749",
        "20 Soojian Dr, Leicester MA 1524",
        "11 Jungle Road, Leominster MA 1453",
        "301 Massachusetts Ave, Lunenburg MA 1462",
        "780 Lynnway, Lynn MA 1905",
        "165 Vaughan Ln, Pell City AL 35125",
        "3700 Hwy 280-431 N, Phenix City AL 36867",
        "1903 Cobbs Ford Rd, Prattville AL 36066",
        "4180 Us Hwy 431, Roanoke AL 36274",
        "13675 Hwy 43, Russellville AL 35653",
        "1095 Industrial Pkwy, Saraland AL 36571",
        "24833 Johnt Reidprkw, Scottsboro AL 35768",
        "1501 Hwy 14 East, Selma AL 36703",
        "7855 Moffett Rd, Semmes AL 36575",
        "150 Springville Station Blvd, Springville AL 35146",
        "690 Hwy 78, Sumiton AL 35148",
        "41301 US Hwy 280, Sylacauga AL 35150",
        "214 Haynes Street, Talladega AL 35160",
        "1300 Gilmer Ave, Tallassee AL 36078",
        "34301 Hwy 43, Thomasville AL 36784",
        "1420 Us 231 South, Troy AL 36081",
        "1501 Skyland Blvd E, Tuscaloosa AL 35405",
        "3501 20th Av, Valley AL 36854",
        "1300 Montgomery Highway, Vestavia Hills AL 35216",
        "4538 Us Hwy 231, Wetumpka AL 36092",
        "2575 Us Hwy 43, Winfield AL 35594"]  

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

5.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.net"
  password = "password"
  u = User.create!(name:  name,
                   email: email,
                   password:              password,
                   password_confirmation: password,
                   activated: true,
                   activated_at: Time.zone.now)
  wo = u.workorders.create!(address: addr.sample, destination: addr.sample)
  wo.update
  Resource.create!(packing: Faker::Boolean.boolean,
                       moving: Faker::Boolean.boolean,
                       rickshaw: Faker::Boolean.boolean,
                       car: Faker::Boolean.boolean,
                       van: Faker::Boolean.boolean,
                       truck: Faker::Boolean.boolean,
                       semi: Faker::Boolean.boolean,
                       workorder_id: wo.id).update_mask
end