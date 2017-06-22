class Api::V1::ProgramsController < ApplicationController
  def index
    @program = Program.where(cip2: params[:cip2])
    render json: @program
  end
end