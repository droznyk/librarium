class Library < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 3..50 }
  validates :description, length: { maximum: 500 }

  belongs_to :user
  has_many :library_books
  has_many :books, through: :library_books
end
