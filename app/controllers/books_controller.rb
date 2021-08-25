class BooksController < ApplicationController
  
  def index
    @books = Book.all
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

    redirect_to "/books"
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update({
      title: params[:book][:title],
      price: params[:book][:price],
      kids_friendly: params[:book][:kids_friendly]
      })

    book.save

    redirect_to "/books/#{book.id}"
  end

  def destroy
    Book.destroy(params[:id])

    redirect_to "/books"
  end

end
