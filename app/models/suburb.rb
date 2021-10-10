class Suburb < ApplicationRecord
    validates :name, presence: true, 
                uniqueness: {case_sensitive: false}, 
                length: { minimum: 1, maximum: 50 }
    has_many :property_suburbs
    has_many :properties, through: :property_suburbs
end