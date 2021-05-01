class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @new_book = Book.new
  end

  def create
    @books = Book.all
    @new_book = Book.new(book_params)
    if @new_book.save
      flash[:notice] = "Book was successfully created."
      redirect_to books_path
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @new_book = Book.new(book_params)
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book)
      flash[:notice] = "Book was successfully updated."
      redirect_to books_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
