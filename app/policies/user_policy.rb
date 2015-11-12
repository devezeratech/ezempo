class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end
  def index?
    @current_user.admin?
  end
  def show?
    User
  end

  def edit?
    update?
  end
  def update?
    @current_user == @user || @current_user.admin?
  end
end