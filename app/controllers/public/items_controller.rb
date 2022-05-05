class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id]
    @items = Item.page(params[:page]).where(genre_id: params[:genre_id])
    else
    @items = Item.page(params[:page])
    end

    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

  private
  def item_params
      params.require(:item).permit(:genre_id)
  end
end
