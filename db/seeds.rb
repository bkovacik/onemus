# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

types = ['creature', 'hero', 'spell', 'terrain']
types.each do |type|
  Type.create(name: type)
end  

chromas = ['anger', 'apathy', 'entropy', 'greed', 'order', 'pride', 'colorless']
chromas.each do |chroma|
  Chroma.create(name: chroma)
end
