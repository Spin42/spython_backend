class PropertySerializer < ActiveModel::Serializer
  attributes :key, :value, :type
end
