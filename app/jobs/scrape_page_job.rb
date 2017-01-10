class ScrapePageJob < ApplicationJob
  queue_as :default

  def perform(url)
    url = url.gsub(/(\/)+$/,'')
    content = ScrapePageUrl.new(url).call
    page = Page.find_or_create_by(url: url)
    page.update(content: content)
  end
end
