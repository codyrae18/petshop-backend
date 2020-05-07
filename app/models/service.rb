class Service < ApplicationRecord
    has_many :appointments
    has_many :pets, through: :appointments 

end
