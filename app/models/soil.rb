class Soil < ApplicationRecord
    has_one_attached :photo
  
    validates :name, :description, presence: true
end