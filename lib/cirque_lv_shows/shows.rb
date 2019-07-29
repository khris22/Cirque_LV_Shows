class CirqueLvShows::Shows 
    attr_accessor :name, :venue, :schedule, :description, :url
    
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
          
        

       binding.pry
    end

    def self.scrape_indv_show
    
    end


end

