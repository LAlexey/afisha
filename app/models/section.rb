class Section < ActiveRecord::Base
  attr_accessible :title

  has_many :blog_posts
end
