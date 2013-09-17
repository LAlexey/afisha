class BlogPostAddition < ActiveRecord::Base
  attr_accessible :emotions, :section_id

  belongs_to :section
end
