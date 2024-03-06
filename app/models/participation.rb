class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :user_id, uniqueness: { scope: :event_id, message: "Vous êtes déjà inscrit à cet événement" }
end
