class Weight < ApplicationRecord
    belongs_to :machine
    belongs_to :routine

    validates :weight, presence: true

end
