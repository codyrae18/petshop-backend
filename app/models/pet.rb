class Pet < ApplicationRecord
    belongs_to :client
    has_many :appointments
    has_one :breed
end
