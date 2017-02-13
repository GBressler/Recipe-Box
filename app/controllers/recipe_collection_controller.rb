class RecipeCollectionController < ApplicationController
  before_action :set_recipe_collection, only: [:show, :edit, :update, :destroy]

  # GET /recipe_collections
  # GET /recipe_collections.json
  def index
    @recipe_collection = RecipeCollection.all
  end

  # GET /recipe_collections/1
  # GET /recipe_collections/1.json
  def show
  end

  # GET /recipe_collections/new
  def new
    @recipe_collection = RecipeCollection.new
  end

  # GET /recipe_collections/1/edit
  def edit
  end

  # POST /recipe_collections
  # POST /recipe_collections.json
  def create
    @recipe_collection = RecipeCollection.new(recipe_collection_params)

    respond_to do |format|
      if @recipe_collection.save
        format.html { redirect_to @recipe_collection, notice: 'Recipe collection was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_collection }
      else
        format.html { render :new }
        format.json { render json: @recipe_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_collections/1
  # PATCH/PUT /recipe_collections/1.json
  def update
    respond_to do |format|
      if @recipe_collection.update(recipe_collection_params)
        format.html { redirect_to @recipe_collection, notice: 'Recipe collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_collection }
      else
        format.html { render :edit }
        format.json { render json: @recipe_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_collections/1
  # DELETE /recipe_collections/1.json
  def destroy
    @recipe_collection.destroy
    respond_to do |format|
      format.html { redirect_to recipe_collections_url, notice: 'Recipe collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_collection
      @recipe_collection = RecipeCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_collection_params
      params[:recipe_collection].permit( :update, :line_item_id)
    end
end
