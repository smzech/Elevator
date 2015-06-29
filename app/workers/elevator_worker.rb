# app/workers/elevator_worker.rb
class ElevatorWorker
  include Sidekiq::Worker
  
  def perform
    PagesController.step
    redirect_to '/pages/info'
  end
end
