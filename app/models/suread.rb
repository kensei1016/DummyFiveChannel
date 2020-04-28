class Suread < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_mant :categories
end
