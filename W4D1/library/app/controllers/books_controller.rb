require 'byebug'
class BooksController < ApplicationController
  def index
    debugger
    @books = Book.all
    render :index
  end

  def new
    debugger
    render :new
  end

  def create
    debugger
    book = Book.new(book_params)
    if book.save
      redirect_to books_url
    else
      render json: book.errors.full_messages, status: :unprocessable_entity
      render :new
    end

  end

  def destroy
    debugger
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
