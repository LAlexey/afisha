module TopList
  module TopListHelper
    def toggle_top_position
      return unless self.respond_to? :top_list_item

      if self.top_list_item
        self.top_list_item.destroy
      else
        self.build_top_list_item(position: 0)
      end

      self.save
    end
  end
end

