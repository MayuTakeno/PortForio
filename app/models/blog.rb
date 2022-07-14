class Blog < ApplicationRecord

  has_one_attached :image

  # employeeを主キーにもつテーブルを参照先に指定
  belongs_to :employee
  has_many :favorites, dependent: :destroy

  has_many :view_counts, dependent: :destroy

  # バリデーション
  validates :title, presence: { message: 'は入力必須です。' }
  validates :body, presence: { message: 'は入力必須です。' }

  # 画像情報有無の分岐処理
  def get_image
    if image.attached?
      image
    else
      'flow01.png'
    end
  end

  def favorited_by?(employee)
     favorites.where(employee_id: employee.id).exists?
  end

  # n日前の投稿を取り出す
  scope :created_days_ago, ->(n) { where(created_at: n.days.ago.all_day) }
  # 過去一週間分の投稿数
  def self.week_count
    (0..6).map { |n| created_days_ago(n).count }.reverse
  end

  # 検索方法(部分検索)
  # def self.looks(search, word)
  #   if search == "partial_match"
  #     @blog = Blog.where("title LIKE?", "%#{word}%")
  #   end
  # end

end
