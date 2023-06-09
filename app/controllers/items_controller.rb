class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  
  

  def index
    @items = Item.all.order("created_at DESC")
    @records = Record.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.all
    @records = Record.all
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to root_path
    end
    if @item.record.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
    else
    end
    redirect_to root_path
  end
  


  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:category_id,:condition_id,:area_id,:delivery_charge_id,:number_id,:price,)
    .merge(user_id: current_user.id)
  end

  def correct_user
    redirect_to root_path unless @item.user_id == current_user.id
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end