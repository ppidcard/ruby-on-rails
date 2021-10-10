class Property < ApplicationRecord
    validates :address, presence: true, 
                uniqueness: {case_sensitive: false}, 
                length: { minimum: 5, maximum: 150 }
    validates :photo, presence: true, 
                uniqueness: {case_sensitive: false}
    validates :description, presence: true,
                length: { minimum: 10, maximum: 1000 }
    belongs_to :user
    has_many :property_suburbs
    has_many :suburbs, through: :property_suburbs
end