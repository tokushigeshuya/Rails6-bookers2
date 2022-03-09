class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comments_params)
    @comment.book_id = @book.id
    @comment.save
    #redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @comment.book_id = @book.id
    @comment.destroy
    #redirect_to request.referer
    #renderしたときに@postのデータがないので@postを定義

  end

  private

  def book_comments_params
    params.require(:book_comment).permit(:comment)
  end

end
