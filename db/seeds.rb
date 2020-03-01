# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fooberto = User.create!(
    email: "fooberto@test.tld",
    user_name: "fooberto"
)

fooberta = User.create!(
    email: "fooba@test.tld",
    user_name: "fooberta"
)

Item.create!(
    [
        {
            title: "Neuromancer",
            description: "Science Fiction novel by William Gibson",
            user: fooberto,
            image_url: "https://en.wikipedia.org/wiki/File:Neuromancer_(Book).jpg#/media/File:Neuromancer_(Book).jpg"
        },
        {
            title: "Blade Runner",
            description: "Science Fiction movie by Ridley Scott",
            user: fooberto,
            image_url: "https://upload.wikimedia.org/wikipedia/en/9/9f/Blade_Runner_%281982_poster%29.png"
        },
        {
            title: "Nausicaä of the Valley of the Wind",
            description: "Animated science fantasy adventure film adapted and directed by Hayao Miyazaki",
            user: fooberta,
            image_url: "https://upload.wikimedia.org/wikipedia/en/b/bc/Nausicaaposter.jpg"
        }
    ]
)
