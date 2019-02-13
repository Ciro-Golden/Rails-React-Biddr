class Auction < ApplicationRecord
    belongs_to :user
    has_many :biddings, dependent: :destroy

    validates :title, :price, :reserve, presence: true

end
