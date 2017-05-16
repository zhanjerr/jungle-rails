class Admin::UsersController < ApplicationController
  before_filter :authorize_admin

  def index
    @users = User.all.order(id: :asc)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(admin: true)
      redirect_to '/admin/users', notice: "User_id:#{@user.id} now an admin"
    else
      redirect_to '/admin/users', notice: "Unsuccessful Action"
    end
  end

end
