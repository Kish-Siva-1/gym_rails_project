class Routine < ApplicationRecord
    belongs_to :user
    has_many :weights
    has_many :machines, through: :weights 
    
end
