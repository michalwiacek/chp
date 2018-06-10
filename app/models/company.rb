class Company < ApplicationRecord

  has_one :address, as: :addressable
  has_many :employees, class_name: "User"
  accepts_nested_attributes_for :address

  validates :name, length: { maximum: 200,
    too_long: '%{count} characters is the maximum allowed' }
end
