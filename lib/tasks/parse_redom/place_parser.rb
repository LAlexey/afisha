module ParseRedom
  class PlaceParser < Parser
    NodesPath = '//schedule/place'.freeze

    def nodes_xpath
      NodesPath
    end

    def parse_node(place_node)
      r_id = place_node.attributes['id'].value

      unless Place.where(r_id: r_id).exists?
        Place.build_me do |place|
          place.r_id = r_id
          place.title = at(place_node, 'title')

          place_category = at(place_node, 'type')
          place.category = Category.where(slug: place_category).first || Category.create(slug: place_category, name: place_category)
          place.city = at(place_node, 'city')

          place.address = at(place_node, 'address')
          place.phone = at(place_node, 'phone')
          place.url = at(place_node, 'url')
          place.description = at(place_node, 'text')
        end
      end
    end
  end
end

