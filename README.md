## Rails Full Text Search with PostGres, Across Tables
### Example and Screencast

This example app shows how to implement full text search on your Ruby on Rails / Postgres app , even with relational data across multiple tables.

[See a screencast of how this app was built](http://aspiringwebdev.com/full-text-search-with-rails-and-postgres-across-multiple-tables/).

Many thanks to thoughtbot for excellent blog entries about this.

### Quick setup if you want to step through the example
1. Run rake db:setup to get up and running with the database, including seed values. If you're looking for a Postgres server for local development and have a Mac, check out [Postgres.app](http://postgresapp.com/).
1. Run rails s and go to http://localhost:3000/books/ - or replace the domain and port as appropriate for your dev environment.
