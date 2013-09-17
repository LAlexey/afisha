class TopListItem < ActiveRecord::Base
  attr_accessible :row_order_position, :position

  belongs_to :positioned, polymorphic: true

  include RankedModel
  #ranks :position
  ranks :row_order, column: :position
end
