{
  _links: {
    self: {href: api_skin_url(@skin)},
    postPicture: {href: "#TODO"}
  },
  token: @skin.token,
  properties: @skin.properties.map do |p|
    {key: p.key, value: p.value, type: p.type}
  end
}.to_json