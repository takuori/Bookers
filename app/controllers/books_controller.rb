class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     render :index
    end
    flash[:complete] = "Book was successfully created."
  end

  def index
    @books = Book.all
    @book =Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     render :edit
    end
    flash[:complete] = "Book was successfully updated."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
