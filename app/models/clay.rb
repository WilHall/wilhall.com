class Clay < ApplicationRecord
  validates :identifier, :name, :shrinkage, :absorption, :description, :url, presence: true
end
