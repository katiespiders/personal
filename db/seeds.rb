# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require './hacker_ipsum.rb'

hacker = HackerIpsum.new

10.times do
  Post.create(hacker.post)
  Blurb.create(hacker.blurb)
end

User.create(name: 'katie', password: 'password')
