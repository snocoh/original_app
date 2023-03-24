class MyPagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]

  def index
    @user = User.find(params[:user_id])
    unless @user.my_page.present?
      render :new
    end
  end

  def new
    @my_page = MyPage.new
  end

  def create
    @my_page = MyPage.new(my_page_params)
    if @my_page.save
      redirect_to root_path
    else
      @user = User.find(params[:user_id])
      render :new
    end
  end
  
  private

  def my_page_params
    params.permit(:name, :profile, :age_id, :prefecture_id, :atelier, :place, :bland, :website, :image).merge(user_id: current_user.id)
  end

  # def move_to_new
    
  # end
end
