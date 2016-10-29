class Category < ApplicationRecord

  has_many    :posts,  dependent: :nullify
  belongs_to  :user

  validates :title, presence: true,
                    uniqueness: true;
end
