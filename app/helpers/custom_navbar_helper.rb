module CustomNavbarHelper
  def drop_down(item, &block)
    klass = 'dropdown'
    if item.is_a? MenuItem
      klass += ' active' if ([item] | item.children).any? { |item| request.url =~ Regexp.new(item.condition)}
      content_tag :li, :class => klass do
        drop_down_link(item.name) + drop_down_list { yield }
      end
    else
      super
    end
  end

  def menu_item(name=nil, path="#", *args, &block)
    if path.is_a? MenuItem
      active_class = 'active' if ([path] | children).any? { |item| request.url =~ Regexp.new(item.condition) }
      content_tag :li, :class => active_class do
        name, path = path, options if block_given?
        link_to name, path.url, options, &block
      end
    else
      super
    end
  end
end
