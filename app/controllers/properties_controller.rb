class PropertiesController < ApplicationController
    before_save{ self.address = self.address.downcase }
    validates :address, presence: true, 
                uniqueness: {case_sensitive: false}, 
                length: { minimum: 5, maximum: 25 }
    validates :photo, presence: true, 
                uniqueness: {case_sensitive: false}
    validates :description, presence: true,
                length: { minimum: 10, maximum: 1000 }
end