class Passenger < ActiveRecord::Base 
  belongs_to :car
  belongs_to :floor
  validates :name, :destination, presence: true
end
