class Category < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :favourites
  has_many :users, through: :favourites
  has_many :events

  #  = Category.all.pluck(:sport)

  def name
    sport
  end
end
