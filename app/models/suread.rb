class Suread < ApplicationRecord
  belongs_to :user
  has_many :responses, dependent: :destroy
  has_and_belongs_to_many :categories
end
