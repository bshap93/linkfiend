class TitleScraper

  attr_reader :title
  def initialize(link)
    @url = link
    @page = Nokogiri::HTML(open(@url))
    @title = @page.search("title").text
  end

end