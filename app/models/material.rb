class Material < ActiveRecord::Base
  include TopList::TopListHelper

  attr_accessible :author_id, :description, :publication_date, :title, :type
  attr_accessible :lock_version

  has_one :top_list_item, as: :positioned, class_name: 'TopList::TopListItem'
  scope :positioned, joins(:top_list_item).eager_load(:top_list_item).order('top_list_items.position')

  validates :title, presence: true
  validates :author_id, presence: true

  # mongoid author
  def author
    User.find(self.author_id)
  end

  def position_id
    top_list_item.id if top_list_item
  end
end
