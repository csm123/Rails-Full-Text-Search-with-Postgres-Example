class AddBookSearchesView < ActiveRecord::Migration
def up
  	ActiveRecord::Base.connection.execute <<-SQL
  		CREATE OR REPLACE VIEW book_searches AS

			SELECT books.id AS searchable_id, 
			'Book' AS searchable_type, 
			books.title AS term
			FROM books

			UNION 

			SELECT books.id AS searchable_id, 
			'Book' AS searchable_type, 
			books.description AS term
			FROM books

			UNION 

			SELECT books.id AS searchable_id, 
			'Book' AS searchable_type, 
			authors.first_name AS term
			FROM authors_books
			JOIN books ON authors_books.book_id = books.id
			JOIN authors ON authors_books.author_id = authors.id

			UNION

			SELECT books.id AS searchable_id, 
			'Book' AS searchable_type, 
			authors.last_name AS term
			FROM authors_books
			JOIN books ON authors_books.book_id = books.id
			JOIN authors ON authors_books.author_id = authors.id

	SQL
  end

def down
	ActiveRecord::Base.connection.execute <<-SQL
  	DROP VIEW book_searches;
  	SQL
end
end
