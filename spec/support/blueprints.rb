require 'machinist/active_record'

# Add your blueprints here.
User.blueprint do
  # name { Faker::Name.name}
  email { Faker::Internet.email}
  password { "password" }
  password_confirmation { "password"}
end