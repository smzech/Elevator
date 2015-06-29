class Floor < ActiveRecord::Base
  has_many :cars
  validates :level, presence: true
  
  def self.list_for_select
    self.all.map do |floor|
      [floor.level, floor.id]
    end
  end

  def self.ground_floor 
  	Floor.where(:level => 1).first
  end
end
