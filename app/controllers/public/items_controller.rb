class Public::ItemsController < ApplicationController
  def index

    @items = Item.page(params[:page])
    @genres = Genre.all
  end

  def show
  end
end
