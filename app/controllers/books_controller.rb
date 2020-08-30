class BooksController < ApplicationController

  def top
  end

  # 記事一覧
  def index
  	@book = Book.new
  	@books = Book.all
  end

  # 詳細表示
  def show
  	@book = Book.find(params[:id])
  end

  # 新規投稿
  def new
  end

  def create
  	@books = Book.all
    @book = Book.new(book_params)

    if @book.save

    # flash=成功した時　notice=文字の色　右の文言を表示
    flash[:notice] = 'successfully'

    # ルーティングからコントローラーを返してviewページを表示させる
    # コントーラーの中のshowアクションを通るイメージ
    redirect_to book_path(@book.id)
	else
		# コントローラーを返さす直接viewページを表示させる
    # コントーラーの中のindexアクションを通らない
    # redirect_toにしてしまうと、@bookが空のインスタンス変数に上書きされてしまう
		render :index
	end
  end

  # 編集画面
  def edit
  	# params 送られてきたパラメータの中からidを選択する
  	@book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
   	  flash[:notice] = 'successfully'
      redirect_to book_path(@book.id)
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
