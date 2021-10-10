class PropertySuburb < ApplicationRecord
    belongs_to :property
    belongs_to :suburb
end