{
  _links: {
    skin: {href: api_skin_url(@property.enrichable)}
  },
  key: @property.key,
  value: @property.value,
  type: @property.type
}.to_json