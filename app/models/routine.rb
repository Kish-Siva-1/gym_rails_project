class Routine < ApplicationRecord
    belongs_to :user
    has_many :weights
    has_many :machines, through: :weights 

    validates :name, presence: true
    validates_uniqueness_of :name, scope: :user_id
    
    
end
