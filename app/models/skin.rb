class Skin < ActiveRecord::Base

  # Associations
  has_many :properties, :as => :enrichable, :dependent => :destroy
  accepts_nested_attributes_for :properties,
    :reject_if => proc { |attributes| attributes["key"].blank? || attributes["value"].blank? || attributes["type"].blank?}

  # Validations
  validates_presence_of :token

  # Callbacks
  before_validation :set_token

  # Scopes
  scope :recently_changed, -> (count) { order("updated_at DESC").limit(count) }
  scope :with_location, -> { joins("LEFT JOIN properties ON (properties.enrichable_id = skins.id)")
                              .where("properties.key = ?", "location").group("skins.id") }

  private

    def set_token
      self.token ||= SecureRandom.hex(3).upcase
    end
end
