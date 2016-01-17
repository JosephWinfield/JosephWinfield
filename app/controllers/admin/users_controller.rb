class Admin::UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end

  private

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path
    end
  end
end
