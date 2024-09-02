require "administrate/base_dashboard"

class TerrariumDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    bottom_soil: Field::BelongsTo,
    customer_email: Field::String,
    customer_name: Field::String,
    decoration: Field::BelongsTo,
    first_succulent: Field::BelongsTo,
    second_succulent: Field::BelongsTo,
    third_succulent: Field::BelongsTo,
    top_soil: Field::BelongsTo,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    customer_name
    customer_email
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    customer_name
    customer_email
    decoration
    top_soil
    bottom_soil
    first_succulent
    second_succulent
    third_succulent
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    customer_name
    customer_email
    decoration
    top_soil
    bottom_soil
    first_succulent
    second_succulent
    third_succulent
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how terrariums are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(terrarium)
  #   "Terrarium ##{terrarium.id}"
  # end
end
