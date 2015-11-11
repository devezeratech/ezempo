class UsersController < ApplicationController
  before_action :set_user, except: :index

  def index
    @users = User.all
    authorize @users
  end

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    respond_to do |format|
      authorize @user
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'User updated successfully.'}
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id]) 
  end

  def user_params
    # used for update create, not for show
    params.require(:user).permit(:email, :password, :contact_number, :date_of_birth, :about, :interests, :position, :avatar, :remove_avatar, :name )
  end

end
