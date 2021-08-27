class BooksController < ApplicationController

  def index
    @books = Book.show_only_true
  end

  def new
  end

  def create
    book = Book.create({
      title: params[:title],
      price: params[:price],
      kids_friendly: params[:kids_friendly]
    })

    redirect_to "/books/#{book.id}"
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
      title: params[:title],
      price: params[:price],
      kids_friendly: params[:kids_friendly]
      })

    book.save

    redirect_to "/books/#{book.id}"
  end

  def destroy
    Book.destroy(params[:book_id])

    redirect_to "/books"
  end

  # private
  #
  # def book_params
  #   params.require(:book).permit(:title, :price, :kids_friendly)
  # end

end
