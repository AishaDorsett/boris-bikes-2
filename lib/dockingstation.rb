class DockingStation
    attr_reader :bike
    attr_accessor :bikes
    def initialize
        @bikes = []      
    end

    def release_bike
        fail 'no bikes available' if @bikes.empty?
        @bikes.pop
        @bike = bike
    end

    def station_availablity 
        @bikes.length
    end

    def docked(bike)
        fail 'Docking station at capacity' if @bikes.count >= 20
        @bikes << bike
        @bike = bike
    end
end