class Dog < ApplicationRecord
    belongs_to :client
    has_one :breed
end
