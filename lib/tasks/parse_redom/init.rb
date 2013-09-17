%w(parser event_parser place_parser seance_parser build_me).each do |file|
  require File.join(File.dirname(__FILE__), file)
end

[Event, Place, Seance].each do |mod|
  mod.send(:include, ParseRedom::BuildMe)
end