class BlogPost < Material
  attr_accessible :blog_post_addition_attributes

  belongs_to :section
  has_one :blog_post_addition
  accepts_nested_attributes_for :blog_post_addition

  scope :with_addition, preload(blog_post_addition: :section)
  delegate :emotions, to: :blog_post_addition, prefix: true, allow_nil: true


end
