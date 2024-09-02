class Terrarium < ApplicationRecord
    include GlobalID::Identification

    belongs_to :top_soil, class_name: "Soil", optional: true
    belongs_to :bottom_soil, class_name: "Soil", optional: true
    belongs_to :decoration, class_name: "Decoration", optional: true
    belongs_to :first_succulent, class_name: "Succulent", optional: true
    belongs_to :second_succulent, class_name: "Succulent", optional: true
    belongs_to :third_succulent, class_name: "Succulent", optional: true
  
    validates :customer_name, :customer_email, presence: true
  end