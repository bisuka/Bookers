class BooksController < ApplicationController

  # 記事一覧
  def index
  	@book = Book.new
  end

  # 詳細表示
  def show
  end

  # 新規投稿
  def new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end

  # 編集画面
  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
