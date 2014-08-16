class Reply < ActiveRecord::Base
  belongs_to :post, counter_cache: true
  belongs_to :user
end
