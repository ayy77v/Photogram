class Post < ApplicationRecord
validates :user_id, presence: true

 # validates :image, presence: true

    has_one_attached :image


    validates :image, file_content_type: {
    allow: ["image/jpeg", "image/png"],
    if: -> { image.attached? },
  }
 


  belongs_to :owner, class_name: "User", foreign_key: :user_id
    has_many :comments, dependent: :destroy

end
