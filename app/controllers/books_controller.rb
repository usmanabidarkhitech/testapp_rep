class BooksController < ApplicationController
   def index
    @books = Book.all
  end
  def new
   @book = Book.new
  end
  def edit
    @book = Book.find(params[:id])
#    respond_to do |format|
#      format.html { redirect_to edit_book_path(@book) }
#      format.xml  { head :ok }
#    end
  end
  def destroy
    @book = Book.find(params[:id])
#    @comment = Comment.find(params[:title])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_path }
      format.xml  { head :ok }
    end
  end
  def create
    @book = Book.new(books_params)
   if @book.save!
   redirect_to books_path , notice: "Successfully created"  
   else
   redirect_to books_path , notice: "Something went wrong, please try again!" 
   end
  end
  def update
    @book = Book.find(params[:id])
   if @book.update(books_params)
   redirect_to books_path , notice: "Successfully updated"  
   else
   redirect_to books_path , notice: "Something went wrong, please try again!" 
   end
  end
  def books_params
    params.require(:book).permit(:title, :content)
  end
end
