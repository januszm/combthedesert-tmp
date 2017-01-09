require 'test_helper'

class ScrapePageJobTest < ActiveJob::TestCase

  setup do
    @url = 'http://example.com'
    @valid_content = { url: @url, h1: [], h2: [], h3: [], links: [] }
  end

  test 'enqueue scrape page url service execution' do
    mock = MiniTest::Mock.new
    mock.expect(:call, @valid_content)
    ScrapePageUrl.stub(:new, -> (t) { assert_equal(@url, t); mock }) do
      ScrapePageJob.perform_now(@url)
    end
    mock.verify
  end

end
