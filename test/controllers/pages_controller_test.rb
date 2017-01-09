require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get page' do
    page = create(:page)
    get page_url(page)
    assert_response :success
    response.body == page.to_json(only: [:id, :url, :content])
  end

  test 'should enqueue scrape page job' do
    url = 'http://example.com'
    assert_enqueued_with(job: ScrapePageJob) do
      post scrape_url_pages_url, params: { url: url }
      assert_response :success
    end
  end

end
