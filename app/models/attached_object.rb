class AttachedObject < ActiveRecord::Base
  attr_accessible :article_id, :attachable_id, :attachable_type

  belongs_to :attachable, polymorphic: true
  belongs_to :article
end
