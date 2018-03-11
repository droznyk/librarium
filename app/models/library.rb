class Library < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 3..50 }
  validates :description, length: { maximum: 500 }
end
