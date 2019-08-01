class CirqueLvShows::Shows
    attr_accessor :title, :venue, :subtitle, :description, :schedule

    @@all = []

    

    def self.all
        @@all
    end

end