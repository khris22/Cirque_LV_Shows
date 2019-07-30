class CirqueLvShows::Scraper
    attr_accessor :name, :venue, :schedule, :description, 
    


    def self.all
        self.scrape_shows
    end

    def self.list
        shows = []
        doc = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/"))
        title = doc.search(".show-caroussel__title").children.map{|name| name.text}
        title.partition.with_index { |_, i| i.even? }# now in nested array

        # title = doc.search(".section__title.about__title").text.gsub("ABOUT ", "")
        # show_name = doc.search(".explore-shows__item__caption")[0..-1].text
        binding.pry
    end
    

    def self.scrape_shows
        shows = []

        shows << self.scrape_cirque

    end
    
    def get_page
        doc = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/ka"))
    end 

    def self.scrape_cirque
        show_name = 

        
        name = doc.css("div.caroussel__item.explore-shows__item div.explore-shows__item__caption")[0].text
            name
            #this will list all shows. put[0] index before .text to see individual show
            #LIST
            description =
            shows = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/ka"))
            show_name = doc.search("div.explore-shows__item__caption")[0].text.gsub("The ", "")
            #MORE INFO
            #show attributes:
            shows = Nokogiri::HTML(open("https://www.cirquedusoleil.com/las-vegas/#{show_name}")) #interpolate the name of show?
            title = shows.search(".section__title.about__title").text.gsub("ABOUT ", "")
            venue  = shows.search(".show-hero__venue").text.strip
            subtitle = shows.search(".section__subtitle.about__subtitle").text.strip
            description = shows.css("div.about__text").text.gsub(/\s+/, ' ').strip
            
            #schedule attributes:
            calendar = shows.search(".calendar.next-show__calendar").text.strip # not scraping correctly
            "No shows scheduled this week!"



       binding.pry
    end

  

end

# [29] pry(CirqueLvShows::Shows)> name.downcase.split.join("-")
# => "michael-jackson-one"
# [30] pry(CirqueLvShows::Shows)> name = doc.search("div.explore-shows__item__caption")[6].text.strip
# => "R.U.N"
# [31] pry(CirqueLvShows::Shows)> name.downcase.gsub(".","")
# => "run"
# [32] pry(CirqueLvShows::Shows)> name.include?(".")
# => true