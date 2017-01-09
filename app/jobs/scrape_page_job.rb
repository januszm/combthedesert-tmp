class ScrapePageJob < ApplicationJob
  queue_as :default

  def perform(url)
    ScrapePageUrl.new(url).call
  end
end
