class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create, :edit, :update]
  def index
    @pictures = Picture.all
  end
  def new
    @picture = Picture.new
    @picture.user_id = current_user.id
  end
  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "投稿を作成しました！"
      else
        render :new
      end
    end
  end
  def show
  end
  def edit
  end
  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"投稿を削除しました！"
  end
  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end
  private
  def picture_params
    params.require(:picture).permit(:title, :content, :user_id, :image, :image_cache)
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
