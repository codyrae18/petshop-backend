class Pet < ApplicationRecord
    belongs_to :client
    has_many :appointments
    has_many :services, through: :appointments
    has_one :breed
    
end
