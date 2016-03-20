# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#before population
User.delete_all

# add admin user first
password = '12345678'
admin = User.new email: 'admin@email.ie', password: password, password_confirmation: password 
admin.save
