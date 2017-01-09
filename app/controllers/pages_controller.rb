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
    ScrapePageUrl.new(params[:url]).call
  end

end
