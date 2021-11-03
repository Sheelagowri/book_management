class Admin::BooksController < AdminController
  before_action :set_book, only: %i[ show edit update destroy ]
    def index
      @books = Book.includes(:category).all
    end
 
    def show
      
    end

    def new
      @book = Book.new
    end

    def edit
    end

    def create
      @book = Book.new(book_params)
      respond_to do |format|
        if @book.save
          format.html { redirect_to admin_book_path(@book), notice: "Book was successfully updated." } #response for HTML request, redirects to show page with a notice "book was sucessfully updated"
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @book.update(book_params)
          format.html { redirect_to admin_book_path(@book), notice: "Book was successfully updated." } #response for HTML request, redirects to show page with a notice "book was sucessfully updated"
        else
          format.html { render :edit, status: :unprocessable_entity }#response for HTML request, render edit method
        end
      end
    end
  
    # DELETE /books/1 or /books/1.json
    def destroy
      respond_to do |format|
        if @book.destroy
        format.html { redirect_to admin_books_path, notice: "Book was successfully destroyed." }
        end
      end
    end

    private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :content, :category_id, :image)
    end
end
