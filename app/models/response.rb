class Response < ApplicationRecord
  belongs_to :suread

  validates :comment,
    presence: true,
    length: { maximum:300 }
end
