class Succulent < ApplicationRecord
    has_one_attached :photo
  
    validates :name, :description, presence: true
end