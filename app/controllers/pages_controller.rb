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
    ScrapePageJob.perform_later(params[:url])
  end

end
