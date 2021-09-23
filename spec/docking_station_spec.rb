require 'dockingstation'

RSpec.describe DockingStation do

   describe 'DockingStation initialize' do
      it 'allows user to set docking station capacity' do
         dock = DockingStation.new(25)
         expect(dock.capacity).to eq 25
      end
   end

   describe '#release_bike' do
      it 'can release a bike' do
         bike = Bike.new
         subject.docked(bike)
         expect(subject.release_bike).to be_an_instance_of(Bike)
      end
         
      it 'raises error when no bikes are docked' do
         expect {subject.release_bike}.to raise_error 'no bikes available'
      end
   end

   describe '#docked' do
      it 'can return the docked bike' do 
         bike = Bike.new
         expect(subject.docked(bike)).to be_an_instance_of(Bike)
      end

      it 'raises an error when someone tries to dock to a station with 20 bikes' do
         bike = Bike.new
         subject.capacity.times { subject.docked Bike.new }
         expect { subject.docked(bike) }.to raise_error 'Docking station at capacity'
      end
   end
end