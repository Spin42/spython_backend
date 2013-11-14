{
  _links: {
    self: {href: api_skin_url(@skin)},
    properties_dictionary: {href: api_properties_dictionary_path},
    postPicture: {href: "#TODO"}
  },
  token: @skin.token,
  properties: @skin.properties.map do |p|
    {key: p.key, value: p.value, type: p.type}
  end
}.to_json