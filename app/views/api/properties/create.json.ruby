json            = @property.as_json
logo_url        = property_logo_url(@property.key)
json[:logo_url] = logo_url if logo_url
puts json

{
  _links: {
    skin: {href: api_skin_url(@property.enrichable)}
  }
}.merge(json).to_json