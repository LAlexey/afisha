module TopList
  class TopListItem < ActiveRecord::Base
    self.table_name = :top_list_items

    include TopList::TopListHelper

    attr_accessible :row_order_position, :position

    belongs_to :positioned, polymorphic: true

    include RankedModel
    ranks :row_order, column: :position
  end
end