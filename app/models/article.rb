class Article < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :user

  validates :title, presence: true, length: {maximum: 140}
  validates :text, presence: true, length: {maximum: 4000}

end
