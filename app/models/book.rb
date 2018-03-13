class Book < ApplicationRecord
  validates :author, presence: :true, length: { in 3..80}
  validates :title, presence: true, uniqueness: true, length: { in: 3..150}
  validates :short_description, length: { maximum: 300}
end
