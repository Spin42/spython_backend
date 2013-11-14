class Property < ActiveRecord::Base

  TYPES = %w(Text Number Image Location)

  self.inheritance_column = :_type_disabled

  # Associations
  belongs_to :enrichable, :polymorphic => true

  # Validations
  validates_presence_of :key, :type, :value
  validates_inclusion_of :type, in: TYPES

  scope :last_known, ->{ group("key").order("created_at DESC") }
end
