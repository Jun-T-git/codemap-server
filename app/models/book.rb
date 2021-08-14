class Book < ApplicationRecord
    has_many :reviews
    validates :title, presence: true, length: {maximum: 255}
    validates :author, presence: true, length: {maximum: 1000}
end
