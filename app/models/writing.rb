class Writing < ApplicationRecord
  validates :title, :description, :url, presence: true
end
