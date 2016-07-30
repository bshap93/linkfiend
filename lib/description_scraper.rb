class DescriptionScraper

  attr_reader :description
  def initialize(link)
    @url = link
    @page = Nokogiri::HTML(open(@url))
    begin
      @description = @page.at('meta[name="description"]')['content']
    rescue
      @description = nil
    end
  end

end