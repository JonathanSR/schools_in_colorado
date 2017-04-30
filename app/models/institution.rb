class Institution < ApplicationRecord
geocoded_by :name
after_validation :geocode, if: ->(obj){obj.name.present? and obj.name_changed? }
end
