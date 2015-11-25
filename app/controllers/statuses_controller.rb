class StatusesController < ApplicationController
  before_action :set_status, only: [ :update, :destroy, :edit,  ]
  before_action :authorize_status, only: [:edit, :update, :destroy]

  def edit
  end

  def new
  end

  def create
    @status = Status.new(status_params)
    respond_to do |format|
      if @status.save
        format.html { redirect_to user_path(@status.user.id), notice: 'Status was successfully updated.'}
      else
        format.html { render :new }
      end
    end
  end
  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to request.referer + "#status-container-#{@status.id}", notice: 'Status was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @status.destroy
    respond_to do |format|
      format.html { redirect_to request.referer + "#timeline-container", notice: 'Status was successfully removed.' }
    end
  end

  private

  def set_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:text_status, :user_id)
  end

  def authorize_status
    authorize @status
  end

end
