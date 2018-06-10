class User < ApplicationRecord
  require 'pry'
  has_one :address, as: :addressable
  belongs_to :company, optional: true
  accepts_nested_attributes_for :address

  validates :first_name, :last_name, presence: true, length: { maximum: 100,
    too_long: '%{count} characters is the maximum allowed' }
  validates :email, presence: true, format: /\A.+@.+\..+\z/, uniqueness: true
  validates :phone, numericality: true, allow_blank: true
  validate :birth_date_cannot_be_in_the_future

  def company_attributes=(company_attributes)
    self.company = Company.find_or_create_by(name: company_attributes[:name])
    if self.company.address.blank?
      self.company.update(company_attributes)
    end
  end

  def birth_date_cannot_be_in_the_future
    if birth_date.present? && birth_date > Date.today
      errors.add(:birth_date, "can't be in the future")
    end
  end
end
