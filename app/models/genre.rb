class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def to_slug
    slug = name.downcase.gsub(" ", "-")
    slug
  end
end
