class PagesController < ApplicationController
  def info
    @floors = Floor.all
    @cars = Car.all
    @passengers = Passenger.all
  end

  def step
    PagesController.perform_step
    redirect_to '/pages/info'
  end

  def self.perform_step
    @cars = Car.all
    @cars.each do |car|
      car.step
    end  
    #up  
  end
end

#cron job -> call a rake task that spawns a sidekiq job that calls PagesController.perform_step_async
