class Api::V1::SavesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only:[:create]
  def create
    # current_user 
    @new_search = current_user.saves.new(save_params)
    if @new_search.save
      render json: 200
    else
      render json: 404
    end
  
    # if @current_user.UserSearches.create(school: params[:school], 
    #                                     ethnicity: params[:ethnicity], 
    #                                     year: params[:year], 
    #                                     program: params[:program],
    #                                     program_grads: params[:program_grads],
    #                                     ethnicity_grads: params[:ethnicty_grads], 
    #                                     percentage_one: params[:percentage_one], 
    #                                     percentage_two:params[:percentage_two]
    #                                     )
  end

  private
  def save_params
    params.permit(:school, :ethnicity, :year, :program, :program_grads, :ethnicity_grads, :percentage_one, :percentage_two)
  end
end