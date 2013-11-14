module ApplicationHelper
  def property_logo_url(key)
    paths = {
      "length"   => asset_path("i-length.png"),
      "width"    => asset_path("i-location.png"),
      "weight"   => asset_path("i-weight.png"),
      "location" => asset_path("i-location.png"),
      "picture"  => asset_path("i-pic.png")
      }
    paths[key]
  end
end
