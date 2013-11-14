{
  _links: {
    self: {href: api_skin_url(@skin)},
    enrich: {href: api_skin_properties_path(@skin)},
    properties_dictionary: {href: api_properties_dictionary_path},
  },
  token: @skin.token,
  properties: @skin.properties.in_chronological_order.to_a.map do |property|
    json            = property.as_json
    logo_url        = property_logo_url(property.key)
    json[:logo_url] = logo_url if logo_url
    json
  end
}.to_json