class LineItemsController < ApplicationController
  #before_action :set_recipe_collection, only: [:create]
  #before_action :set_recipe, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy, :last_eaten] 


  def index
   
    @line_items = LineItem.where(nil) 
    @line_items = LineItem.all

      respond_to do |format|
      format.html
      format.pdf do
        render pdf: "line_items", disposition: "inline", template: "line_items/index.html.erb"   # Excluding ".pdf" extension.
      end
      end


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
    user = current_user
    
    @line_item = user.line_items.build(recipe: recipe) 
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.recipe, notice: 'Line item was successfully created.' }
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

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def replace_weekly_line_item
    id_of_line_item_to_replace = params[:line_item_id].to_i
    current_ids_of_line_items_this_week = ids_of_line_items_this_week
    replacing_id = LineItem.where.not(id: current_ids_of_line_items_this_week)
                           .order("RANDOM()")
                           .first.id
    cookies[:this_week_line_item_ids] = current_ids_of_line_items_this_week - [id_of_line_item_to_replace] + [replacing_id]

    redirect_to action: :index
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.

    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:recipe_id, :recipe_collection_id, :last_eaten, :id_of_recipe_to_remove, :ingredient)
    end

    helper_method :ids_of_line_items_this_week
    def ids_of_line_items_this_week
      # line items of the week are stored in the cookie cookies[:this_week_line_item_ids]

      # first make it a blank string if it is nil
      cookies[:this_week_line_item_ids] = "" if cookies[:this_week_line_item_ids].nil?

      # Rails stores array of values in cookies in a string, where the values are joined with "&"
      # i.e. the array [1,2,3] is stored in the string "1&2&3"
      # to have the ids we need to "unjoin" (i.e. split) the string
      this_week_line_item_ids = cookies[:this_week_line_item_ids].split "&"
      # make sure the ids are integers, not strings
      this_week_line_item_ids.map! { |id| id.to_i }

      # if we have less than 3 we complete by random other ones
      missing_line_items_nb = 7 - this_week_line_item_ids.size
      completing_line_item_ids = LineItem.order("RANDOM()")
                                         .where.not(id: this_week_line_item_ids)
                                         .limit(missing_line_items_nb)
                                         .pluck(:id)

      # we update the cookie so that now it also includes the completing ids
      cookies[:this_week_line_item_ids] = this_week_line_item_ids + completing_line_item_ids

      # we return the ids
      this_week_line_item_ids
    end
  
end
