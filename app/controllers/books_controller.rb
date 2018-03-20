class BooksController < ApplicationController
  before_action :fetch_book, only: %w[show edit update destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "#{@book.title} has been created successfully!"
      redirect_to book_path(@book)
    else
      flash[:error] = @book.errors.full_messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @book.update(book_params)
      flash[:notice] = "#{@book.title} has been updated successfully!"
      redirect_to book_path(@book)
    else
      flash[:error] = @book.erorrs.full_messages
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "#{@book.title} has been deleted!"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:author, :title, :short_description)
  end

  def fetch_book
    @book = Book.find(params[:id])
  end

end
