class Category < ApplicationRecord
  has_and_belongs_to_mant :users
end
