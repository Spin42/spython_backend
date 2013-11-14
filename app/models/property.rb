class Property < ActiveRecord::Base

  TYPES = %w(Text Number Image Location)

  AVAILABLE_PROPERTIES = [
    {key: "region of origin",  type: "Text"},
    {key: "country of origin", type: "Text"},
    {key: "length",            type: "Number"},
    {key: "width",             type: "Number"},
    {key: "weight",            type: "Number"},
    {key: "location",          type: "Location"},
    {key: "picture",           type: "Image"},
  ]

  self.inheritance_column = :_type_disabled

  # Associations
  belongs_to :enrichable, :polymorphic => true

  # Validations
  validates_presence_of :key, :type, :value
  validates_inclusion_of :type, in: TYPES

  scope :last_known, ->{ group("key").order("created_at DESC") }
end
