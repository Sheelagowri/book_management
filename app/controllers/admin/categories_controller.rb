class Admin::CategoriesController < AdminController
    before_action :set_category, only: %i[ show edit update destroy ]

    # GET /categories or /categories.json
    def index
      @categories = Category.all
    end
  
    # GET /categories/1 or /categories/1.json
    def show
    end
  
    # GET /categories/new
    def new
      @category = Category.new
    end
  
    # GET /categories/1/edit
    def edit
    end
  
    # POST /categories or /categories.json
    def create
      @category = Category.new(category_params)
      respond_to do |format|
        if @category.save
          format.html { redirect_to admin_category_path(@category), notice: "Category was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /categories/1 or /categories/1.json
    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to admin_category_path(@category), notice: "Category was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /categories/1 or /categories/1.json
    def destroy
      respond_to do |format|
        if @category.destroy?
        format.html { redirect_to admin_categories_path, notice: "Category was successfully destroyed." }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
    def set_category
     @category = Category.find(params[:id])
    end
  
      # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end