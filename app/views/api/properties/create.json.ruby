{
  _links: {
    skin: {href: api_skin_url(@property.enrichable)}
  }
}.merge(@property.as_json).to_json