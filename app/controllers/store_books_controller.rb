class StoreBooksController < ApplicationController

  def index
    @store = Store.find(params[:store_id])
    @books = @store.books
  end

  def new
    @store = Store.find(params[:store_id])
  end

  def create
    store = Store.find(params[:store_id])
    book = store.books.create({
      title: params[:title],
      price: params[:price],
      kids_friendly: params[:kids_friendly]
    })

    redirect_to "/stores/#{store.id}/books"
  end

  def show
    @book = Book.find(params[:book_id])
  end

  def edit
    @book = Book.find(params[:book_id])
  end

  def update
    store = Store.find(params[:store_id])
    book = store.books.find(params[:book_id])
    book.update({
      title: params[:book][:title],
      price: params[:book][:price],
      kids_friendly: params[:book][:kids_friendly]
      })

    book.save

    redirect_to "/stores/#{store.id}/books/#{book.id}"
  end

  def destroy
    store = Store.find(params[:store_id])
    Book.destroy(params[:book_id])

    redirect_to "/stores/#{store.id}/books"
  end

end
