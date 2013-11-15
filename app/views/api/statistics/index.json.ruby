{
  skin_count: @skin_count,
  skins: @recently_changed_skins.map do |skin|
    {
      token: skin.token,
      updated_at: skin.updated_at,
      last_property: skin.properties.last,
      properties: skin.properties.last_known.map do |p|
        {key: p.key, value: p.value, type: p.type, unit: p.unit}
      end
    }
  end,
  skin_locations: @skins_with_location.map do |skin|
    skin.properties.last_known.with_key("location").first.value
  end
}.to_json