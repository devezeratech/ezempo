class StatusesController < ApplicationController
  before_action :set_status, only: [ :update, :destroy ]


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
        format.html { redirect_to edit_status_path(@status), notice: 'Status was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:text_status, :user_id)
  end



end
