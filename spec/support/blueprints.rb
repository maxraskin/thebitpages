require 'machinist/active_record'

# Add your blueprints here.
User.blueprint do
  name { Faker::Name.name}
  email { Faker::Internet.email }
  password { "password" }
  password_confirmation { "password"}
end

Merchant.blueprint do
  name { Faker::Name.name }
  bname { Faker::Name.name }
  email { Faker::Internet.email }
  password { "password" }
  password_confirmation { "password"}
end