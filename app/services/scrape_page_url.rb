require 'open-uri'
require 'nokogiri'

class ScrapePageUrl

  def initialize(url)
    @url = url
    @content = { url: url, h1: [], h2: [], h3: [], links: [] }
  end

  def call
    html = open(url)
    # TODO handle errors
    doc = Nokogiri::HTML(html)
    %i(h1 h2 h3).each do |header|
      doc.css(header).each { |h| @content[header] << h.text }
    end
    doc.css('a').each { |a| @content[:links] << a['href'] }
    @content
  end

end
