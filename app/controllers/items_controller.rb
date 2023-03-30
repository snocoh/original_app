class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item_form = ItemForm.new
    @user = current_user
    unless @user.my_page.present?
      redirect_to new_user_my_page_path(user_id: current_user.id)
    end
      
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

  def show
    @item = Item.find(params[:id])
    @my_page = @item.user.my_page
  end

  def edit
    @item = Item.find(params[:id])
    item_attributes = @item.attributes
    @item_form = ItemForm.new(item_attributes)
    @item_form.tag_name = @item.tags.first&.tag_name
  end

  def update
    @item = Item.find(params[:id])
    @item_form = ItemForm.new(item_form_params)

    @item_form.images ||= @item.images.blobs
    
    if @item_form.valid?
      @item_form.update(item_form_params, @item)
      redirect_to "/items/#{@item.id}"
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      # item.item_tags.destroy_all
      item.destroy
      redirect_to root_path
    end
  end

  private
  
  def item_form_params
    params.require(:item_form).permit(:product, :content, :category_id, :postage_id, :delivery_day_id, :price, :tag_name, {images: []}).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  
end