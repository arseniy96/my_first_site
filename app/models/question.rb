class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :category
  validates :question, presence: true, length: {maximum: 400}
  validates :username, presence: true
end
