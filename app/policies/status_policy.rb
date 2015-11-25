class StatusPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @status = model
  end
  def create?
    @current_user == @status.user
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def update?
    @current_user == @status.user || @current_user.admin?
  end

  def destroy?
    update?
  end

end
