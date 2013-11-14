{
  skin_count: @skin_count,
  skins: @recently_changed_skins.map do |skin|
    {token: skin.token, updated_at: skin.updated_at}
  end
}.to_json