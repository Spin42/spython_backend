{
  _links: {
    skins: @skins.map do |s|
      {href: api_skin_path(s), token: s.token}
    end
  }
}.to_json