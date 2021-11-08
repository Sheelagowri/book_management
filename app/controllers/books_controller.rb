class BooksController < ApplicationController

  
  helper_method :sort_column, :sort_direction
  def index

    params[:category_id] && @books = Book.where(category_id: params[:category_id])
    if (params[:title])
      @books = Book.where("title LIKE ?", "%#{params[:title]}%")
    elsif (params[:category_id])
      @books = Book.where("category_id = ?", params[:category_id])
    else
      @books = Book.order(sort_column + " " + sort_direction)
    end
      
     
    
    
    

    
  end

  def show
    @book = Book.find(params[:id])
  end


  private
  
  def sort_column
    Book.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
