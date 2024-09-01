class Glaze < ApplicationRecord
    enum :minimum_cone, { "04": "04", "5": "5", "6": "6" }, prefix: true, scopes: false
    enum :maximum_cone, { "04": "04", "5": "5", "6": "6" }, prefix: true, scopes: false
    enum :primary_color, { "red": "red", "orange": "orange", "yellow": "yellow", "green": "green", "blue": "blue", "purple": "purple", "pink": "pink", "brown": "brown", "black": "black", "white": "white", "gray": "gray", "gold": "gold", "silver": "silver"}, prefix: true, scopes: false
  
    has_one_attached :test_tile_photo
  
    validates :identifier, :name, :description, :minimum_cone, :maximum_cone, presence: true
    validates :food_safe, inclusion: [true, false]

    def cone_range
      if minimum_cone == maximum_cone
        minimum_cone
      else
        "#{minimum_cone}–#{maximum_cone}"
      end
    end

    def canonical_identifier
      identifier
    end
  end