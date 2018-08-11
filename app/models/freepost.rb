class Freepost < ApplicationRecord
  has_many :freecomments
  has_many :freelikes
  has_many :freedislikes
end
