# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create([
    {
        name: "Rob", email:"rob@yahoo.com", password: "12345", password_confirmation: "12345"
    },
    {
        name: "Jack", email:"Jack@yahoo.com", password: "12345", password_confirmation: "12345"
    },
    {
        name: "Sean", email:"Sean@yahoo.com", password: "12345", password_confirmation: "12345"
    },
    {
        name: "Bob", email:"Bob@yahoo.com", password: "12345", password_confirmation: "12345"
    }
])

List.create([
    {
    name: "My List", note: "The best list", user: User.first
    },
    {
    name: "Listy List", note: "The greatest list", user: User.first
    },
    {
    name: "Whoo", note: "I love it", user: User.first
    },
    {
    name: "Listy", note: "The greatest list", user: User.second
    },
    {
    name: "Litty List", note: "The g list", user: User.second
    },
    {
    name: "Mom's house", note: "The best", user: User.third
    },
    {
    name: "What a list", note: "The list", user: User.third
    },
])