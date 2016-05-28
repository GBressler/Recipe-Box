class LineItemsController < ApplicationController
  #include Recipe
  before_action :set_recipe_collection, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy, :menu, :last_eaten]


 #def menu
  #  @line_items.last_week
  #  puts 'hello/n'

   #@line_items.two_weeks_ago
 #end

  #def last_week
   # @line_items = @line_items.last_week
    #render 'index'
  #end

 # def two_weeks_ago
  #  @line_items = @line_items.two_weeks_ago

#    render 'index'
 # end
  # GET /line_items
  # GET /line_items.json
  def index
    #@line_items = LineItem.all
    @line_items = LineItem.where(nil) #this is required, having only this will allow me to call all scopes in the view
    @line_items = LineItem.all
    #@line_items = @line_items.last_week(Date.today-3.weeks) #shows from 3 and 2 weeks ago, reead last 7 from arrray?
    #@line_items = @line_items.three_weeks_ago
    #@line_items = LineItem.three_weeks_ago
    #menu_params(params).each do |key, value|
     # @line_items =  @line_items.public_send(key, value) if value.present?
    #@line_items = LineItem.filter(params.slice(:last_eaten))
    #@line_items.menu
  end

 
  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    recipe = Recipe.find(params[:recipe_id])
    @line_item = @recipe_collection.line_items.build(recipe: recipe) #consider @recipe, also on line 29

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.recipe_collection, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  #def menu
   # list = []
    #if LineItem.last_eaten > 21.days.ago.to_date
     # LineItem.last_eaten.each do |recipe_id|
      #  LineItem.recipe_id  << list
      #end
   # end
   # list
  #end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:recipe_id, :recipe_collection_id, :last_eaten)
    end
end
