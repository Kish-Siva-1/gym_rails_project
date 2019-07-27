class Machine < ApplicationRecord
    has_many :weights
    has_many :routines, through: :weights

    validates :name, presence: true, :uniqueness => true
    validates :repetitions, presence: true
    validates :sets, presence: true

    def weights_attributes=(weight_attributes)
        weight_attributes.values.each do |weight_attribute|
            if weight_attribute[:machine_id].empty?
                
                weight = Weight.create(weight_attribute)
                self.weights << weight
            else 
                weight = Weight.find_by(weight_attribute.except(:weight))
                self.weights[-1].update_attribute(:weight, weight.weight)
            end
        end
    end

end
