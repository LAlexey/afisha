module ParseRedom
  class Parser
    def at(node, attr)
      n = node.at(attr).try(:content)
    end

    def get_attr(node, attr, options={})
      value = node[attr]

      value_type = options[:type]
      if value_type && value
        value = case value_type
                  when :datetime then DateTime.parse(value) rescue nil
                end
      end

      value
    end

    def initialize(doc)
      @doc = doc
    end

    def parse
      nodes = @doc.xpath(nodes_xpath)
      #puts actions.count
      nodes.each do |node|
        parse_node(node)
      end
    end

    private
    #overridings
    def nodes_xpath
      raise 'not implemented'
    end
    def parse_node(node)
      raise 'not implemented'
    end
  end
end