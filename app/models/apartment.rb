class Apartment < ApplicationRecord
    belongs_to :user
    validates :street, :state, :city, :price, presence: true
end
