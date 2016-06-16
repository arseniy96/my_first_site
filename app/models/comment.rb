class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  validates :text, presence: true, length: {maximum: 2500}
  validates :username, presence: true

  acts_as_votable
end
