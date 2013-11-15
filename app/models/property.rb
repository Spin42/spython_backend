class Property < ActiveRecord::Base

  TYPES = %w(Text Number Image Location)
  UNITS = %w(cm g)

  AVAILABLE_PROPERTIES = [
    {key: "length",   type: "Number", unit: "cm"},
    {key: "width",    type: "Number", unit: "cm"},
    {key: "weight",   type: "Number", unit: "g" },
    {key: "location", type: "Location"          },
    {key: "picture",  type: "Image"             }
  ]

  self.inheritance_column = :_type_disabled

  # Associations
  belongs_to :enrichable, :polymorphic => true

  # Validations
  validates_presence_of :key, :type, :value
  validates_inclusion_of :type, in: TYPES
  validates_inclusion_of :unit, in: UNITS, :allow_nil => true

  scope :in_chronological_order, -> { order('created_at ASC') }
  scope :with_key,               -> (key) { where(:key => key) }

  def self.last_known_for_enrichable_and_property(enrichable_id, property_key)
    query = "
      SELECT DISTINCT ON (p.key) p.*
      FROM properties p
      WHERE p.enrichable_id = ?
      AND p.key = ?
      ORDER BY p.key, p.updated_at DESC
    "

    self.find_by_sql [query, enrichable_id, property_key]
  end

  def self.last_known_for(enrichable_id)
    query = "
      SELECT p.*
      FROM properties p
      WHERE p.enrichable_id = ?
      GROUP BY p.key, p.id
      ORDER BY p.updated_at DESC
    "

    self.find_by_sql [query, enrichable_id]
  end

  def as_json(options = {})
    json = {
      key: key,
      value: value,
      type: type,
      timestamp: created_at.to_i

    }
    json[:unit]     = unit if unit
    json
  end
end
