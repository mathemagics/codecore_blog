class Post < ApplicationRecord


  has_many :comments, -> {order(created_at: :desc)}, :dependent => :destroy
  has_many :favourites, dependent: :destroy
  has_many :favouriters, through: :favourites, source: :user

  belongs_to :category
  belongs_to :user



  validates :title, presence: true,
                    uniqueness: true

  validates :body, presence: true

  def self.search(search)
    if search
      Post.all.where( "title ILIKE ? OR body ILIKE ?",
                      "%#{search}%",
                      "%#{search}%").order(created_at: :desc)
    else
      Post.all.order(created_at: :desc)
    end
  end

  def like_for(user)
    favourites.find_by(user: user)
  end

  


end
