class StoreBooksController < ApplicationController

  def index
    @store = Store.find(params[:store_id])
    @books = @store.books
  end

  def new
  end

  def create
    book = Book.new({
      title: params[:book][:title],
      price: params[:book][:price],
      kids_friendly: params[:book][:kids_friendly]
    })

    book.save

    redirect_to "/stores/:store_id/books"
  end

  def show
    @book = Book.find(params[:book_id])
  end

  def edit
    @book = Book.find(params[:book_id])
  end

  def update
    book = Book.find(params[:book_id])
    book.update({
      title: params[:book][:title],
      price: params[:book][:price],
      kids_friendly: params[:book][:kids_friendly]
      })

    book.save

    redirect_to "/stores/:store_id/books/#{book.book_id}"
  end

  def destroy
    Book.destroy(params[:book_id])

    redirect_to "/stores/:store_id/books"
  end

end
