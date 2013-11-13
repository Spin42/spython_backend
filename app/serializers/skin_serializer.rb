class SkinSerializer < ActiveModel::Serializer
  attributes :token, :_links

  has_many :properties

  def _links
    {
      self: {href: api_skin_url(object)},
      postPicture: {href: "#TODO"}
    }
  end

end
