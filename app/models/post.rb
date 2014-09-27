class Post < ActiveRecord::Base
  has_many :replies
  belongs_to :user
  belongs_to :section

  validates :body, presence: true
  validates :body, length: { minimum: 4 }
end
