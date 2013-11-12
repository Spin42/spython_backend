class Property < ActiveRecord::Base
  # Associations
  belongs_to :enrichable, :polymorphic => true

  # Validations
  validates_presence_of :key, :value
end
