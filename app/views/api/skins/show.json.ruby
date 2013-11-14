{
  _links: {
    self: {href: api_skin_url(@skin)},
    properties_dictionary: {href: api_properties_dictionary_path},
    postPicture: {href: "#TODO"}
  },
  token: @skin.token,
  properties: @skin.properties.in_chronological_order.map do |p|
    {timestamp: p.created_at.to_i, key: p.key, value: p.value, type: p.type}
  end
}.to_json