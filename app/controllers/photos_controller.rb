class PhotosController < ApplicationController
  before_action :authorize_user, except: [
    :index,
    :show
  ]

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      flash[:notice] = "Photo successfully added"
      redirect_to photo_path(@photo)
    else
      flash[:notice] = "Operator Error!!"
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:url, :description)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path
    end
  end
end
