class Property < ActiveRecord::Base

  TYPES = %w(Text Number Image Location)

  # Associations
  belongs_to :enrichable, :polymorphic => true

  # Validations
  validates_presence_of :key, :type, :value
  validates_inclusion_of :type, in: TYPES

end
