class Pet < ApplicationRecord
    belongs_to :client
    has_one :breed
end
