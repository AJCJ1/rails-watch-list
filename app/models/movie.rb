class Movie < ApplicationRecord
  has_many :bookmarks

  # belongs_to :lists, through: :bookmarks
  validates :title,
            presence: true,
            uniqueness: true
  validates :overview,
            presence: true

end
