# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@user = User.create(
  email: 'testing@example.com',
  password: 'Test1234!',
  password_confirmation: 'Test1234!'
)
@friend1 = User.create(
  email: 'friend1@example.com',
  password: 'Test1234!',
  password_confirmation: 'Test1234!'
)
@friend2 = User.create(
  email: 'friend2@example.com',
  password: 'Test1234!',
  password_confirmation: 'Test1234!'
)