{
  skins: @skins.map do |s|
    {token: s.token, url: api_skin_url(s)}
  end
}.to_json