class Client < ApplicationRecord
  encrypts :api_key, deterministic: true
  validates :name, :api_key, presence: true, uniqueness: true
end
