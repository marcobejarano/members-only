class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :body, presence: true, length: { minimum: 4 }
end
