require 'test_helper'

class ScrapePageJobTest < ActiveJob::TestCase

  setup do
    @url = 'http://example.com'
  end

  test 'enqueue scrape page url service execution' do
    mock = MiniTest::Mock.new
    mock.expect(:call, true)
    ScrapePageUrl.stub(:new, -> (t) { assert_equal(@url, t); mock }) do
      ScrapePageJob.perform_now(@url)
    end
    mock.verify
  end

end
