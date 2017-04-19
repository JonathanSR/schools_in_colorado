class ResearchJob < ApplicationJob
  queue_as :urgent

  def perform
  end
end
