class Skin < ActiveRecord::Base

  # Associations
  has_many :properties, :as => :enrichable
  accepts_nested_attributes_for :properties,
    :reject_if => proc { |attributes| attributes["key"].blank? || attributes["value"].blank? }

  # Validations
  validates_presence_of :uid

  # Callbacks
  before_validation :set_uid

  private

    def set_uid
      self.uid ||= SecureRandom.uuid
    end
end
