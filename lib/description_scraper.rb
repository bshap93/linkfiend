class DescriptionScraper

  attr_reader :description
  def initialize(link)
    @url = link
    @page = Nokogiri::HTML(open(@url))
    @description = @page.at('meta[name="description"]')['content']
  end

end