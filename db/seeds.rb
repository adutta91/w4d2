# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "Date"
COLORS = %w(
calico black brown white orange
)

10.times do

  Cat.create!(
  birth_date: Faker::Date.backward(100),
  color: COLORS.sample,
  name: Faker::Hipster.word,
  sex: ['m','f'].sample,
  description: Faker::Hacker.say_something_smart
  )

end

CatRentalRequest.create!(
  cat_id: 1,
  start_date: Date.new(2016, 1, 1),
  end_date: Date.new(2016, 2, 1),
  status: "PENDING"
)

CatRentalRequest.create!(
  cat_id: 1,
  start_date: Date.new(2016, 1, 15),
  end_date: Date.new(2016, 2, 15),
  status: "PENDING"
)

CatRentalRequest.create!(
  cat_id: 1,
  start_date: Date.new(2016, 1, 15),
  end_date: Date.new(2016, 2, 15),
  status: "PENDING"
)

CatRentalRequest.create!(
  cat_id: 1,
  start_date: Date.new(2016, 2, 15),
  end_date: Date.new(2016, 3, 15),
  status: "PENDING"
)

CatRentalRequest.create!(
  cat_id: 1,
  start_date: Date.new(2016, 2, 15),
  end_date: Date.new(2016, 3, 15),
  status: "APPROVED"
)
