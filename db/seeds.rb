# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

author_list = [
	[ "Corey", "Martin"],
	[ "Jane", "Doe"],
	[ "Jim", "Doe"]
]

author_list.each do |first_name, last_name|
	Author.create(first_name: first_name, last_name: last_name)
end

book_list = [
  [ "Learning how to do full text search", "This is an awesome guide on how to implement PostGres full text search in Rails.  Really top of its class.", ["Corey", "Jane"] ],
  [ "The Best Grilled Cheese", "Want to make the best grilled cheese in the world? Jim Doe and Jane Jones walk you through the latest culinary techniques for an old classic.", ["Jane", "Jim"] ]
]

book_list.each do |title, description, authors|
  book = Book.create( title: title, description: description )
  authors.each do |author|
  	book.authors << Author.where(:first_name => author).first
  end 
end