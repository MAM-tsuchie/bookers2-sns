class Book < ApplicationRecord
  belongs_to :user # commit 79b3044で修正済み
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  scope :all_sort_by_favcount, -> {
    select('books.*,fav.book_favorite_count')
    .joins("left join
        (
          select book_id,count(book_id) as book_favorite_count
          from favorites
          where created_at > #{Date.today.ago(2.weeks).strftime('%Y-%m-%d')}
          group by book_id
        ) as fav
        on fav.book_id = books.id")
    .order('fav.book_favorite_count desc')
  }
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
