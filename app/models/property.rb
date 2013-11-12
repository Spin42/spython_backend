class Property < ActiveRecord::Base
  # Associations
  belongs_to :enrichable, :polymorphic => true

  # Validations
  validates_presence_of :key, :value, :enrichable_id, :enrichable_type
end
