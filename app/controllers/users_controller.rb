class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index, :new, :create]
  before_action :authorize_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    authorize @users
  end

  def show
    @statuses = @user.statuses.order(created_at: :desc).limit(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully created.'}
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'User was updated successfully.'}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    confirm_password(params[:password], params[:password_confirmation])
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id]) 
  end

  def user_params
    # used for update create, not for show
    params.require(:user).permit(:email, :password, :contact_number, :date_of_birth, :about, :interests, :position, :avatar, :remove_avatar, :name, :admin)
  end

  def authorize_user
    authorize @user
  end

end
