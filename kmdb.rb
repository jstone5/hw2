# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
puts ""
puts "--- Script Begins Here ---"
puts ""
Movies.destroy_all
People.destroy_all
Roles.destroy_all

# Generate models and tables, according to the domain model
# TODO!
# (Models created in the schema.rb file.)

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

# Create movie data
values = { title: "Batman Begins", year_released: "2005", rated: "PG-13", person_id: 1 }
new_movie = Movies.new(values)
new_movie.save

values = { title: "The Dark Knight", year_released: "2008", rated: "PG-13", person_id: 1 }
new_movie = Movies.new(values)
new_movie.save

values = { title: "The Dark Knight Rises", year_released: "2012", rated: "PG-13", person_id: 1 }
new_movie = Movies.new(values)
new_movie.save

puts "There are currently #{Movies.all.count} movies in the database."

batman_begins = Movies.where({ title: "Batman Begins" })[0]
the_dark_knight = Movies.where({ title: "The Dark Knight" })[0]
the_dark_knight_rises = Movies.where({ title: "The Dark Knight Rises" })[0]

# Create person data
values = { name: "Christopher Nolan" }
new_person = People.new(values)
new_person.save

values = { name: "Christian Bale" }
new_person = People.new(values)
new_person.save

values = { name: "Michael Caine" }
new_person = People.new(values)
new_person.save

values = { name: "Liam Neeson" }
new_person = People.new(values)
new_person.save

values = { name: "Katie Holmes" }
new_person = People.new(values)
new_person.save

values = { name: "Gary Oldman" }
new_person = People.new(values)
new_person.save

values = { name: "Heath Ledger" }
new_person = People.new(values)
new_person.save

values = { name: "Aaron Eckhart" }
new_person = People.new(values)
new_person.save

values = { name: "Maggie Gyllenhaal" }
new_person = People.new(values)
new_person.save

values = { name: "Tom Hardy" }
new_person = People.new(values)
new_person.save

values = { name: "Joseph Gordon-Levitt" }
new_person = People.new(values)
new_person.save

values = { name: "Anne Hathaway" }
new_person = People.new(values)
new_person.save

puts "There are currently #{People.all.count} people in the database."


# Create roles data

#Batman Begins Roles
values = { movie_id: batman_begins.id, person_id: People.where({ name: "Christian Bale" })[0].id, character_name: "Bruce Wayne" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: batman_begins.id, person_id: People.where({ name: "Michael Caine" })[0].id, character_name: "Alfred" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: batman_begins.id, person_id: People.where({ name: "Liam Neeson" })[0].id, character_name: "Ra's Al Ghul" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: batman_begins.id, person_id: People.where({ name: "Katie Holmes" })[0].id, character_name: "Rachel Dawes" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: batman_begins.id, person_id: People.where({ name: "Gary Oldman" })[0].id, character_name: "Commissioner Gordon" }
new_role = Roles.new(values)
new_role.save

# The Dark Knight Roles
values = { movie_id: the_dark_knight.id, person_id: People.where({ name: "Christian Bale" })[0].id, character_name: "Bruce Wayne" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: the_dark_knight.id, person_id: People.where({ name: "Heath Ledger" })[0].id, character_name: "Joker" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: the_dark_knight.id, person_id: People.where({ name: "Aaron Eckhart" })[0].id, character_name: "Harvey Dent" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: the_dark_knight.id, person_id: People.where({ name: "Michael Caine" })[0].id, character_name: "Alfred" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: the_dark_knight.id, person_id: People.where({ name: "Maggie Gyllenhaal" })[0].id, character_name: "Rachel Dawes" }
new_role = Roles.new(values)
new_role.save

# The Dark Knight Rises Roles
values = { movie_id: the_dark_knight_rises.id, person_id: People.where({ name: "Christian Bale" })[0].id, character_name: "Bruce Wayne" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: the_dark_knight_rises.id, person_id: People.where({ name: "Gary Oldman" })[0].id, character_name: "Commissioner Gordon" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: the_dark_knight_rises.id, person_id: People.where({ name: "Tom Hardy" })[0].id, character_name: "Bane" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: the_dark_knight_rises.id, person_id: People.where({ name: "Joseph Gordon-Levitt" })[0].id, character_name: "John Blake" }
new_role = Roles.new(values)
new_role.save

values = { movie_id: the_dark_knight_rises.id, person_id: People.where({ name: "Anne Hathaway" })[0].id, character_name: "Selina Kyle" }
new_role = Roles.new(values)
new_role.save

puts "There are currently #{Roles.all.count} roles in the database."
puts ""

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

# Create variables to make naming conventions in loop code easier
movies = Movies.all
people = People.all
director = People.where(name: "Christopher Nolan")[0]
roles = Roles.all
movie_counter = 0
role_counter = 0
else_counter = 0

for movie in movies
    movie_counter += 1
    puts "Movie ##{movie_counter}: #{movie.title}  #{movie.year_released}  #{movie.rated}  #{director.name}"
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""



# Query the cast data and loop through the results to display the cast output for each movie
# TODO!

# Single "for" loop with "where" clauses to pull in the correct movie name and actor name for each role.
for role in roles
    specific_actor = People.where(id: role.person_id)[0]
    specific_movie = Movies.where(id: role.movie_id)[0]
    role_counter += 1
    puts "Role ##{role_counter}:\t#{specific_movie.title}  #{specific_actor.name}  #{role.character_name}"
end