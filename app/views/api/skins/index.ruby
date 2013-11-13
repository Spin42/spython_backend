{
  skins: @skins.map do |s|
    {token: s.token, url: api_skin_path(s)}
  end
}.to_json