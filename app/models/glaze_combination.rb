class GlazeCombination < ApplicationRecord
    enum :primary_color, { "red": "red", "orange": "orange", "yellow": "yellow", "green": "green", "blue": "blue", "purple": "purple", "pink": "pink", "brown": "brown", "black": "black", "white": "white", "gray": "gray", "gold": "gold", "silver": "silver"}, prefix: true, scopes: false

    has_one_attached :test_tile_photo
    
    belongs_to :first_glaze, class_name: "Glaze"
    belongs_to :second_glaze, class_name: "Glaze"
  
    validates :name, :description, :first_glaze, :second_glaze, presence: true

    def cone_range
      minimum_cone = [first_glaze.minimum_cone, second_glaze.minimum_cone].sort_by { |cone| Glaze.minimum_cones.keys.index(cone) }.last
      maximum_cone = [second_glaze.maximum_cone, second_glaze.maximum_cone].sort_by { |cone| Glaze.maximum_cones.keys.index(cone) }.first

      if minimum_cone == maximum_cone
        minimum_cone
      else
        "#{minimum_cone}–#{maximum_cone}"
      end
    end

    def canonical_identifier
      "#{first_glaze.identifier}×#{second_glaze.identifier}"
    end

    def food_safe
      first_glaze.food_safe && second_glaze.food_safe
    end
  end