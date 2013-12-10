class BooksController < ActionController::Base
  def index
  	if params[:search].present?
  		@books = BookSearch.new(query: params[:search]).results
  	else
  		@books = Book.all
  	end
  end
end
