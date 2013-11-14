@available_properties.map do |property|
  property[:logo_url] = property_logo_url(property[:key])
  property
end.to_json