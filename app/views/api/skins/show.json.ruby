{
  _links: {
    self: {href: api_skin_url(@skin)},
    enrich: {href: api_skin_properties_path(@skin)},
    properties_dictionary: {href: api_properties_dictionary_path},
  },
  token: @skin.token,
  properties: @skin.properties.in_chronological_order.to_a
}.to_json