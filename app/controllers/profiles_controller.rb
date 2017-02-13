class ProfilesController < ApplicationController
  def index
  	@user = User.all
    #@users = User.page(params[:page])
    @line_items = LineItem.where(:user_id == current_user.id)
  end

  def show
  	@user = current_user

    @line_items = LineItem.where(:user_id == current_user.id)
    # @user = User.where(username: params[:id])
      #@line_items = @user.line_items.recipes(params[:line_items])
    #else
     # flash[:alert] = 'Profile not found.'
      #redirect_to profiles_path
    #end
    
    
  end
end
