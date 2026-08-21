class Book < ApplicationRecord
    belongs_to :category 

    has_many :histories

    enum :status, {
        available: "available",
        borrowed: "borrowed",
    }, prefix: :status

    validates :author, :title, :status, presence: true
end
