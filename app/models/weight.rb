class Weight < ApplicationRecord
    belongs_to :machine
    belongs_to :routine

    validates :name, presence: true

end
