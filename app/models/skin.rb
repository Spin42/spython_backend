class Skin < ActiveRecord::Base

  # Associations
  has_many :properties, :as => :enrichable

  # Validations
  validates_presence_of :uid

  # Callbacks
  before_validation :set_uid

  private

    def set_uid
      self.uid ||= SecureRandom.uuid
    end
end
