class ArtCategory < ApplicationRecord
  has_many :creators
  has_many :heirs
end
