require 'test_helper'

class ScrapePageUrlTest < ActiveSupport::TestCase

  test 'scrape content from url' do
    url = 'http://example.com'
    content =  ScrapePageUrl.new(url).call
    assert_equal content[:url], 'http://example.com'
    assert_equal content[:h1], ['Example Domain']
    assert_equal content[:links], ['http://www.iana.org/domains/example']
  end

end
