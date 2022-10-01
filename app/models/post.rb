class Post < ApplicationRecord

  has_one_attached :image

  belongs_to :customer

  has_many :likes, dependent: :destroy

  has_many :comments, dependent: :destroy

def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
end

end
