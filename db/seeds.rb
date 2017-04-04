# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User
user = User.create email: 'user@user.com', password: '12345678', name: 'haha'

# Shark
shark = user.sharks.create name: 'Bot', cetacea: KeyValues::Shark::Cetacea.find_by_code('comic').id, desc: 'hahahah', web_url: '', facebook_url: '', github_url: ''

# Bots
shark.bots.create kind: KeyValues::Bot::Kind.find_by_code('facebook').id, bot_id: 'facebook_bot'
shark.bots.create kind: KeyValues::Bot::Kind.find_by_code('line').id, bot_id: 'line_bot'
