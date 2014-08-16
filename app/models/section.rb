class Section < ActiveRecord::Base
  belongs_to :section
  has_many :posts

  def get_replies_count
    self.posts.sum('replies_count')
  end

end
