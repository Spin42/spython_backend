class Attribute < ActiveRecord::Base
    belongs_to :enrichable, :polymorphic => true

    validates_presence_of :key, :value, :enrichable_id, :enrichable_type
end
