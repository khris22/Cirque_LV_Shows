class CirqueLvShows::Scraper
    attr_accessor :title, :url, :venue, :schedule, :description, 
    
    def self.all
        self.scrape_shows
    end

    def self.list_title
        doc = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/"))
        url = doc.css(".show-caroussel__cta a").map{ |link| link['href']}
        title = doc.css(".show-caroussel__title").map{ |title_name| title_name.children.first.text}  
        # binding.pry
    end
    
    def self.scrape_shows
        shows = []
        shows << self.scrape_page
    end

    def self.get_page
        # show_details = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/ka"))
        # doc = Nokogiri::HTML(open("https://www.cirquedusoleil.com#{shows.url}")) #needs to put url to go to the next web to scrape
    end 

    def self.scrape_page
        show_details = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/ka"))
            #MORE INFO
            title = show_details.search(".about__title").text
            venue  = show_details.search(".show-hero__venue").text.strip
            subtitle = show_details.search(".about__subtitle").text.strip
            description = show_details.css(".about__text").text.gsub(/\s+/, ' ').strip

            # binding.pry      
    end

    def get_calendar
        get_page
        # #schedule attributes:
        calendar_note = show_details.search(".calendar__note").text.strip
        # available_dates = 
    end
  

end