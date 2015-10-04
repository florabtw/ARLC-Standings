# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

League.create(name: 'Solo')
League.create(name: 'Doubles')
League.create(name: 'Standard')

Region.create(name: 'North America')
Region.create(name: 'Europe')
Region.create(name: 'Australia')
