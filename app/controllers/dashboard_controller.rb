class DashboardController < ApplicationController

  def show
    @statuses = Status.all.order(created_at: :desc).limit(10)
  end

end
