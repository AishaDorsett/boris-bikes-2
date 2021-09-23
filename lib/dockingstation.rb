class DockingStation
    #allow the docking station instance to change its own cpacity after created
    attr_accessor :capacity

    DEFAULT_CAPACITY=20

    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @bikes = []    
    end

    def release_bike
        fail 'no bikes available' if @bikes.empty?
        @bikes.pop
    end

    def docked(bike)
        fail 'Docking station at capacity' if full?
        @bikes << bike
        @bike = bike
    end

    private 
    
    attr_reader :bikes

    def full?
        @bikes.length == DEFAULT_CAPACITY
    end
end