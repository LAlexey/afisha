module ParseRedom
  class EventParser < Parser
    NodesPath = '//schedule/event'.freeze

    def nodes_xpath
      NodesPath
    end

    def parse_node (event_node)
      r_id = event_node.attributes['id'].value
      r_id = /[[:digit:]]+/.match(r_id).to_s

      unless Event.where(r_id: r_id).exists?
        Event.build_me do |event|
          event.r_id = r_id
          event_category = at(event_node, 'type')
          event.category = Category.where(slug: event_category).first || Category.create(slug: event_category, name: event_category)

          event.age_restricted = at(event_node, 'age-restricted')
          event.title = at(event_node, 'title')
          event.original = at(event_node, 'original')
          event.runtime = at(event_node, 'runtime')

          country_names = at(event_node, 'country')
          event.countries = country_names.split(', ') unless country_names.blank?

          event.year = at(event_node, 'year')
          event.release_date = at(event_node, 'release_date')

          event.director = at(event_node, 'director')
          event.cast = at(event_node, 'cast')

          event.url = at(event_node, 'url')
          event.description = at(event_node, 'text')

          img_uri = at(event_node, 'image')

          if img_uri
            image = Event::EventPicture.new
            image.data = URI.parse(img_uri)
            event.image = image
          end
        end
      end
    end
  end
end