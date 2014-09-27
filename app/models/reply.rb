class Reply < ActiveRecord::Base
  belongs_to :post, counter_cache: true
  belongs_to :user

  validates :body, presence: true
  validates :body, length: { minimum: 4 }
end
