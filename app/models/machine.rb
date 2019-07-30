class Machine < ApplicationRecord
    has_many :weights
    has_many :routines, through: :weights

    validates :name, presence: true
    validates :repetitions, presence: true
    validates :sets, presence: true
    
    scope :dup_check, -> (name) { where("name = ?", name).size }

    def weights_attributes=(weight_attributes)
        weight_attributes.values.each do |weight_attribute|
            if weight_attribute[:machine_id].empty?
                weight = Weight.create(weight_attribute)
                self.weights << weight
            else 
                new_weight = weight_attribute.select { |k,v| k == "weight" }.values[0]
                Weight.find_by(weight_attribute.except(:weight)).update_attribute(:weight, new_weight)
            end
        end
    end

end
