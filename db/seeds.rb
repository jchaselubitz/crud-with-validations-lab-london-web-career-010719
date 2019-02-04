
require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)

Song.create(title: "Hold On", released: true, release_year: 2013, artist_name: "Alabama Shakes", genre: "Rock")