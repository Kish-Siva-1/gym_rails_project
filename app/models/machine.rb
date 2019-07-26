class Machine < ApplicationRecord
    has_many :weights
    has_many :routines, through: :weights

    accepts_nested_attributes_for :weights

end
