class Suread < ApplicationRecord
  belongs_to :user
  has_many :responses, dependent: :destroy
  has_and_belongs_to_many :categories

  validates :title,
    presence: true,
    length: { maximum:50 }

  validates :comment,
    presence: true,
    length: { maximum:300 }
end
