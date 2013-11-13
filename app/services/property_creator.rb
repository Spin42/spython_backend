class PropertyCreator

  def initialize(skin)
    @skin = skin
  end

  def create_properties!(properties)
    Property.transaction do
      properties.each { |property| create_property!(property) }
    end
  end

  def create_property!(attributes)
    Property.create!(attributes.merge(enrichable: @skin))
  end

end