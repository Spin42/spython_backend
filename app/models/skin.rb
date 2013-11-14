class Skin < ActiveRecord::Base

  # Associations
  has_many :properties, :as => :enrichable
  accepts_nested_attributes_for :properties,
    :reject_if => proc { |attributes| attributes["key"].blank? || attributes["value"].blank? || attributes["type"].blank?}

  # Validations
  validates_presence_of :token

  # Callbacks
  before_validation :set_token

  private

    def set_token
      self.uid ||= SecureRandom.uuid[0,6].upcase
    end
end
