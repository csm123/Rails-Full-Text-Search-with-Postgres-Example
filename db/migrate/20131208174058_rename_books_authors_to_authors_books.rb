class RenameBooksAuthorsToAuthorsBooks < ActiveRecord::Migration
  def change
  	rename_table :books_authors, :authors_books
  end
end
