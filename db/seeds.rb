# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.find_or_create_by([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.find_or_create_by(name: 'Emanuel', city: cities.first)

types = ['creature', 'hero', 'spell', 'terrain']
types.each do |type|
  Type.find_or_create_by(name: type)
end  

chromas = ['anger', 'apathy', 'entropy', 'greed', 'order', 'pride', 'colorless']
chromas.each do |chroma|
  Chroma.find_or_create_by(name: chroma)
end

Room.find_or_create_by(name: "Lobby")

phases = ['refresh', 'terrain', 'draw', 'summoning 1', 'action', 'summoning 2', 'capture', 'end']
phases.each do |phase|
  Phase.find_or_create_by(name: phase)
end
