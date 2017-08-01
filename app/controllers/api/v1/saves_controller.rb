class Api::V1::SavesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only:[:create, :destroy]
  
  def create
    @new_search = current_user.saves.new(save_params)
    if @new_search.save
      render json: @new_search, status: 201
    else
      render json: 404
    end
  end

  def destroy
    Safe.delete(params[:id])
    render partial: "users/remaining_saves", locals: {safe: Safe}, layout: false, status: 204
  end

  private
  def save_params
    params.permit(:school, :ethnicity, :year, :program, :program_grads, :ethnicity_grads, :percentage_one, :percentage_two)
  end
end