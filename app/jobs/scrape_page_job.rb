class ScrapePageJob < ApplicationJob
  queue_as :default

  def perform(url)
    content = ScrapePageUrl.new(url).call
    Page.create(url: url, content: content)
  end
end
