class StoreBooksController < ApplicationController

  def index
    @store = Store.find(params[:store_id])
    @books = @store.books
    @books_ordered = @books.alphabetical_order
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
    @store = Store.find(params[:store_id])
    @book = @store.books.find(params[:book_id])
  end

  def edit
    @store = Store.find(params[:store_id])
    @book = @store.books.find(params[:book_id])
  end

  def update
    store = Store.find(params[:store_id])
    book = store.books.find(params[:book_id])
    book.update({
      title: params[:title],
      price: params[:price],
      kids_friendly: params[:kids_friendly]
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
