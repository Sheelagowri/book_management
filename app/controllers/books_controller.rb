class BooksController < ApplicationController

  helper_method :sort_column, :sort_direction
  
  def index
    @books = Book.all
    if (params[:title])
      @books = Book.where("title LIKE ?", "%#{params[:title]}%")
    end
    if (params[:category_id])
      @books = @books.where("category_id = ?", params[:category_id]) 
    end
    if (params[:sort] && params[:direction])
      @books = @books.order(sort_column + " " + sort_direction)
    end

     case (params.has_key?(:price_range))
     when (params[:price_range] == "0..100")
      @books= @books.where('price <= 100')
     when (params[:price_range] == "100..200")
      @books= @books.where('price < 200 and price>100')
     when (params[:price_range] == "200..500")
      @books= @books.where('price > 300 and price<500')
     when (params[:price_range] == "above 500")
      @books= @books.where('price >= 500')
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
