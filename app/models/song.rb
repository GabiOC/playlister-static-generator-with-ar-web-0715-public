class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def to_slug
    slug = name.downcase.gsub(" ", "-")
    slug
  end
end
