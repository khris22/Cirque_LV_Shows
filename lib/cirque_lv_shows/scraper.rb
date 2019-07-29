class CirqueLvShows::Shows 
    attr_accessor :name, :venue, :schedule, :description, 
    
    def self.all
        self.scrape_shows
    end

    def self.scrape_shows
        shows = []

        shows << self.scrape_cirque

    end
    
    def self.scrape_cirque
        doc = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/events"))
        name = doc.css("div.caroussel__item.explore-shows__item div.explore-shows__item__caption")[0].text
            name
            #this will list all shows. put[0] index before .text to see individual show
        
            description =
            shows = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/ka")) #interpolate the name of show?
            
            title = shows.search(".section__title.about__title").text.gsub("ABOUT ", "")
            venue  = shows.search(".show-hero__venue").text.strip
            subtitle = shows.search(".section__subtitle.about__subtitle").text.strip

            description = shows.css("div.about__text").text.gsub(/\r\n+/, ' ') #remove paragraph whitespace
            calendar = shows.search(".calendar.next-show__calendar").text.strip # not scraping correctly



       binding.pry
    end

  

end

