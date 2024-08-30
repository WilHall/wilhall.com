class Press < ApplicationRecord
  has_one_attached :photo

  validates :title, :description, :url, presence: true
end
