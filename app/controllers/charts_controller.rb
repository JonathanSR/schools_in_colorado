class ChartsController < ApplicationController
include ChartsHelper

  def index
    gender_stats(params[:college], params[:program])
    ethnicity_stats(params[:college], params[:program])
    age_stats(params[:college], params[:program])
  end
end