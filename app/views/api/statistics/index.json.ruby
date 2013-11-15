{
  skin_count: @skin_count,
  skins: @recently_changed_skins.map do |skin|
    {token: skin.token, updated_at: skin.updated_at}
  end,
  skin_locations: @skins_with_location.map do |skin|
    skin.properties.with_key("location").in_chronological_order.limit(1).first.value
  end
}.to_json