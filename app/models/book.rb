class Book < ApplicationRecord
  validates :author, presence: true, length: { in: 3..80}
  validates :title, presence: true, uniqueness: true, length: { in: 3..150}
  validates :short_description, length: { maximum: 300}

  has_many :library_books
  has_many :libraries, through: :library_books
end
