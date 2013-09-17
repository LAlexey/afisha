module TopList
  module TogglingHelper
    def toggled_link(record, link_path, already_changed, options = {})
      options.reverse_merge! toggling_id: 'toggling'

      if already_changed
        initial_text = options[:changed_text]
        initial_class = options[:changed_class]

        changed_text = options[:initial_text]
        changed_class = options[:initial_class]
      else
        initial_text = options[:initial_text]
        initial_class = options[:initial_class]

        changed_text = options[:changed_text]
        changed_class = options[:changed_class]
      end

      data = {}
      data[:initial_text] = initial_text || ''
      data[:changed_text] = changed_text || ''

      data[:initial_class] = initial_class if initial_class
      data[:changed_class] = changed_class if changed_class

      record_id = "#{options[:toggling_id]}_#{record.id}"
      link_to initial_text, link_path, method: :post, remote: true, id: record_id, class: initial_class, data: data
    end

    def add_toggling_link(id)
      content_for :document_ready do
        raw "init_toggle_link('#{id}');"
      end
    end
  end
end
