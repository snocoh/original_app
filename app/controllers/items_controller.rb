class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_form_params)
    if @item_form.valid?
      @item_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def edit
  #   @item = Item.find(params[:id])
  #   item_attributes = @item.attributes
  #   @item_form = ItemForm.new(item_attributes)
  # end

  # def update
  #   @item = Item.find(params[:id])
  #   @item_form = ItemForm.new(item_form_params)
  #   if @item_form.valid?
  #     @item_form.update(item_form_params, @item)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  private
  
  def item_form_params
    params.require(:item_form).permit(:product, :content, :category_id, :postage_id, :delivery_day_id, :price, {images: []}).merge(user_id: current_user.id)
  end

  
end