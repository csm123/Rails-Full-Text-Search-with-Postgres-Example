class AddBookSearchesIndices < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute <<-SQL
      CREATE INDEX index_books_on_title ON books USING gin(to_tsvector('english', title));
      CREATE INDEX index_books_on_description ON books USING gin(to_tsvector('english', description));
      CREATE INDEX index_authors_on_first_name ON authors USING gin(to_tsvector('english', first_name));
      CREATE INDEX index_authors_on_last_name ON authors USING gin(to_tsvector('english', last_name));
    SQL
  end

  def down
    ActiveRecord::Base.connection.execute <<-SQL
      DROP INDEX index_books_on_title;
      DROP INDEX index_books_on_description;
      DROP INDEX index_authors_on_first_name;
      DROP INDEX index_authors_on_last_name;
    SQL
  end

end
