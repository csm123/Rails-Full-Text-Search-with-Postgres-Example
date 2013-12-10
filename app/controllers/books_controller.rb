class BooksController < ActionController::Base
  def index
  	@books = Book.all
  end
end
