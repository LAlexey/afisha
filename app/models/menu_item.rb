class MenuItem < ActiveRecord::Base
  attr_accessible :name, :url, :condition, :depth, :lft, :parent_id, :rgt

  acts_as_nested_set
  include TheSortableTree::Scopes

  belongs_to :menu_item, foreign_key: :parent_id
end
