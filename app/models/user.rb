class User < ApplicationRecord

  has_many :posts,    dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :favourites, dependent: :destroy
  has_many :favourited_products, through: :favourites, source: :post

  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :email,       presence: true,
                          uniqueness: true
  has_secure_password

  def get_full_name
    "#{first_name} #{last_name}".titleize
  end

end
