require 'test_helper'

class PageTest < ActiveSupport::TestCase

  test 'should serialize scraped content' do
    content_hash = { url: 'http://example.com', h1: [], h2: [], h3: [], links: [] }
    page = build(:page)
    page.content = content_hash
    retrieved_content = page.content
    assert_equal retrieved_content, content_hash
  end

end
