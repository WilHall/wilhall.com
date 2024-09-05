class Photo < ApplicationRecord
    enum :category, { "portrait": "portrait", "landscape": "landscape", "other": "other" }, prefix: true, scopes: false
    has_one_attached :photo
  
    validates :category, presence: true
  end