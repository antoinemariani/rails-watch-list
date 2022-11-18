# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'
require 'json'

page = 1

3.times do
  puts "Starting to seed page #{page}"
  n = 0
  20.times do
    puts "Starting to seed result at index #{n}"
    url = "https://api.themoviedb.org/3/movie/top_rated?api_key=2a3967e1d44e8206d68d2d365366f7bd&language=en-US&page=#{page}"
    json = JSON.parse(URI.open(url).read)
    Movie.create(
      title: json.values[1][n].values[5],
      overview: json.values[1][n].values[6],
      poster_url: "https://image.tmdb.org/t/p/w500#{json.values[1][n].values[8]}",
      rating: json.values[1][n].values[12]
    )
    puts "Finished seeding result at index #{n}"
    n += 1
  end
  puts "Finished seeding page #{page}"
  page += 1
end
puts 'Seeding complete'

# movie = Movie.create(
#   title: Faker::Movie.title,
#   overview: Faker::Movie.quote,
#   poster_url: 'https://picsum.photos/200/300',
#   rating: rand(0.0..10.0).round(1)
# )

  # url = "https://api.themoviedb.org/3/search/movie?api_key=2a3967e1d44e8206d68d2d365366f7bd&query=#{movie.title.split(' ').join('%20')}&page=1&include_adult=false"
  # json = JSON.parse(URI.open(url).read)
  # movie.poster_url = "https://image.tmdb.org/t/p/w500#{json.values[1][0].values[8]}"
  # movie.overview = json.values[1][0].values[8]
  # movie.rating = json.values[1][0].values[12]
# url = "https://api.themoviedb.org/3/search/movie?api_key=2a3967e1d44e8206d68d2d365366f7bd&query=#{'fight club'.split(' ').join('%20')}&page=1&include_adult=false"
