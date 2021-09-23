require 'dockingstation'

RSpec.describe DockingStation do

   describe '#release_bike' do
      it 'can release a bike' do
         bike = Bike.new
         subject.docked(bike)
         expect(subject.release_bike).to eq bike
      end
         
      it 'returns error when no bikes are docked' do
         expect {subject.release_bike}.to raise_error 'no bikes available'
      end

      it 'can return the docked bike' do 
         bike = Bike.new
         expect(DockingStation.new.docked(bike)).to eq bike
      end

      it 'raises an error when someone tries to dock to a station with 20 bikes' do
         bike = Bike.new
         20.times { subject.docked Bike.new }
         expect { subject.docked(bike) }.to raise_error 'Docking station at capacity'
      end
   end
end