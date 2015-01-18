# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "louis@gmail.com", first_name: "Louis", last_name: "Lai", password: "password", password_confirmation: "password")
User.first.tasks.create(task: "My first task", all_tags:'love, work')
