class PagesController < ApplicationController

  def index
    @pages = Page.all
    render json: @pages
  end

  def show
    @page = Page.find(params[:id])
    render json: @page
  end

  def scrape_url
    if params[:url] =~ URI::regexp
      ScrapePageJob.perform_later(params[:url])
      message = 'Scrape job submitted!'
      status = :ok
    else
      message = 'Incorrect URL'
      status = :bad_request
    end
    render json: { message: message }, status: status
  end

end
