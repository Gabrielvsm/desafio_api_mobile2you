class Title < ApplicationRecord
  has_many :title_actors
  has_many :title_categories
  has_many :title_directors

  has_many :actors, through: :title_actors
  has_many :directors, through: :title_directors
  has_many :categories, through: :title_categories

  belongs_to :type
  belongs_to :country
  belongs_to :release_year
  belongs_to :rating

  validates :show_id, uniqueness: true
end
