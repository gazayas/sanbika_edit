# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
User.create!(
  name: "gabe",
  email: "gabe@example.com",
  password: "gabe",
  password_confirmation: "gabe",
  activated: false,
  activated_at: Time.zone.now
)


99.times do |n|
  name  = "user#{n}"
  email = "example-#{n+1}@example.org"
  password = "user"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end
=end
