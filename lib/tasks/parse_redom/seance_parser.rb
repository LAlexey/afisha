module ParseRedom
  class SeanceParser < Parser
    NodesPath = '//schedule/section'.freeze

    def nodes_xpath
      NodesPath
    end

    def parse_node(section_node)
        r_id = section_node.attributes['id'].value

        unless Seance.where(r_id: r_id).exists?
          Seance.build_me do |seance|
            seance.r_id = r_id

            seance.date_start = get_attr(section_node, 'date_start', type: :datetime)
            seance.date_finish = get_attr(section_node, 'date_finish', type: :datetime)
            seance.times = get_attr(section_node, 'time').split(', ')
            seance.format  = get_attr(section_node, 'format')

            place_id = section_node.at('place').attributes['id'].value
            seance.place = Place.where(r_id: place_id).first

            event_str = section_node.at('event').attributes['id'].value
            event_id = /[[:digit:]]+/.match(event_str).to_s
            seance.event = Event.where(r_id: event_id).first
          end
        end
    end
  end
end