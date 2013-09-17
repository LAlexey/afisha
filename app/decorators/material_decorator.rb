class MaterialDecorator < BaseDecorator
  def top_link_button
    options = {initial_text: h.t('helpers.links.add_top_list'), changed_text: h.t('helpers.links.remove_from_top_list')}

    options[:initial_class] = 'toggling btn btn-mini btn-success'
    options[:changed_class] = 'toggling btn btn-mini btn-info'
    h.toggled_link(self, h.top_list.toggle_position_admin_top_lists_path(id: self, klass: self.object.class.name), self.top_list_item, options)
  end
end