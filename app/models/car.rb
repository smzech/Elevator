class Car < ActiveRecord::Base
  has_many :passengers, -> { order(:destination) }
  belongs_to :floor
  validates :name, presence: true
  
  before_save :default_values
  
  def self.list_for_select
    self.all.map do |car|
      [car.name, car.id]
    end
  end
  
  def default_values
    self.floor_id ||= 1
  end
  
  def step
    ground_floor = Floor.ground_floor
    current_floor = self.floor.level
    dest_floor = ground_floor
    if passengers.count > 0
      #determine destination based of first passenger destination that isn't 1
      passengers.each do |passenger|
        if passenger.destination != 1
          dest_floor = passenger.destination
          break;
        end
        #if no break, all dests are 1, send to ground floor
        dest_floor = ground_floor
      end
      # reset all riders seeking that dest to dest of 1
      # get ALL passengers getting off at this floor
      others = passengers.where(destination: dest_floor) 
      # send all to ground floor
      others.update_all(:destination => ground_floor)
    else
      # otherwise, this car is going to ground floor if nobody is on it
      dest_floor = ground_floor
    end
    self.floor = Floor.where(level: dest_floor).first
    self.save
  end
end
