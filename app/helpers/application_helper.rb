module ApplicationHelper
  def property_logo_url(key)
    paths = {
      "length"   => asset_url("i-length.png"),
      "width"    => asset_url("i-length.png"),
      "weight"   => asset_url("i-weight.png"),
      "location" => asset_url("i-location.png"),
      "picture"  => asset_url("i-pic.png")
      }
    paths[key]
  end
end
