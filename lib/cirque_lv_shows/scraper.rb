class CirqueLvShows::Scraper
    attr_accessor :name, :venue, :schedule, :description, 
    
    def self.all
        self.scrape_shows
    end

    def list
        shows = []
        doc = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/"))
        title = doc.css(".show-caroussel__title").children.first.text 
        url = doc.css(".show-caroussel__cta a").attr("href").value
        # binding.pry
    end
    
    def self.scrape_shows
        shows = []
        shows << self.scrape_cirque
    end

    def get_page
        doc = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas#{shows.url}"))
    end 

    def self.scrape_cirque
            show_details = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/ka"))
            # show_name = show_details.search("div.explore-shows__item__caption")[0].text.gsub("The ", "")
            #MORE INFO
            #show attributes:
            # shows = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/#{show_name}")) #interpolate the name of show?
            # title = show_details.search(".section__title.about__title").text.gsub("ABOUT ", "")
            venue  = show_details.search(".show-hero__venue").text.strip
            subtitle = show_details.search(".section__subtitle.about__subtitle").text.strip
            description = show_details.css("div.about__text").text.gsub(/\s+/, ' ').strip
            # #schedule attributes:
            calendar_note = show_details.search(".calendar__note").text.strip
            binding.pry      
    end

  

end