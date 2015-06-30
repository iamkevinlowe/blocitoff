class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(item_params)

    if @item.save
      flash[:notice] = "New task created."
    else
      flash[:error] = "There was an error creating the task. Please try again."
    end
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "\"#{@item.description}\" has been removed."
    else
      flash[:error] = "There was an error removing the task. Please try again."
    end
    redirect_to @user
  end

  private

  def item_params
    params.require(:item).permit(:description)
  end
end