require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

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

  test 'should scrape page url' do
    url = 'http://example.com'
    post scrape_url_pages_url, params: { url: url }
    assert_response :success
  end

end
