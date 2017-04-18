class Admin::PhotosController < ApplicationController
	before_action :authorize_user

	def delete
		Photo.find(params[:id]).destroy
		redirect_to photos_path
	end

	def destroy
		Photo.find(params[:id]).destroy
		redirect_to photos_path
	end
	private
	def authorize_user
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path
    end
  end
end
