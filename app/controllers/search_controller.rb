class SearchController < ApplicationController
before_action :authorize!
caches_action :show
include PorosHelper

  def show
  end
end
