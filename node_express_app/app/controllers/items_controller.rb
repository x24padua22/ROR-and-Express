class ItemsController < ApplicationController

  # renders a view to create a new stuff
  def new
    if(current_user)
  	 @item = Item.new
    else
      redirect_to new_session_path
    end
  end

  # show all the stuff added
  def show
  	@items = Item.all
  end

  # method to create a new stuff
  def create
  	@item = Item.new(item_params)
  	@item[:user_id] = current_user.id # add the user_id in the @item variable

    #save the data 
    if @item.save
      render json: {:item => @item, :user => @item.user.name}
    end
  end

  # strong parameter for item creation
  def item_params
    params.require(:item).permit(:user_id, :name, :quantity)
  end
end
