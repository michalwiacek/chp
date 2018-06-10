class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true

  validates :street, :city, :zip_code, presence: true

  validates :zip_code, format: { with: /\A\d{2}-\d{3}\z/,
    message: "only polish zip-code allowed" }

end
