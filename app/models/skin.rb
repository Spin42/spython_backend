class Skin < ActiveRecord::Base

    has_many :attributes, :as => :enrichable

    validates_presence_of :uid
end
