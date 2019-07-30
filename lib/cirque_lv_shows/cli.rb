class CirqueLvShows::CLI

    def call
        list_shows
        menu
        goodbye
    end

    def list_shows
        puts "Cirque Du Soleil Shows in Las Vegas"
        @shows = CirqueLvShows::Scraper.list
        @shows.map do |show, i|
            puts "(#{i + 1})  #{show.name}"
        end
    end

    def menu
        input = nil
        while input != "exit"
            puts "For more info on the show, please enter the number:"
            input = gets.strip.downcase
            
            if input.to_i > 0
                the_show = @shows[input.to_i - 1]
                puts "#{the_show.name} - #{the_show.venue} - #{the_show.schedule} - #{the_show.description} - #{the_show.url}"
            elsif input == "list"
                list_shows
            else
                puts "Please enter the number again or type list or exit."
            end
        end
    end

    def goodbye
        puts "Thank you! Have a great day!"
    end
end