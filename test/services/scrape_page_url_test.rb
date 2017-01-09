require 'test_helper'

class ScrapePageUrlTest < ActiveSupport::TestCase

  test 'scrape content from url' do
    url = 'http://example.com'
    assert ScrapePageUrl.new(url).call
  end

end
